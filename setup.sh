#!/usr/bin/env bash
# LibreGEO installer.
#
# Registers this checkout as the libre-geo Claude Code plugin marketplace and
# installs the libre-geo plugin (all 12 GEO skills) through the Claude Code
# CLI, so Claude Code actually loads them. It does the same thing as running,
# inside Claude Code:
#   /plugin marketplace add HermeticOrmus/LibreGEO-Claude-Code
#   /plugin install libre-geo@libre-geo
#
# With --grok it installs into Grok Build through the grok CLI instead. The
# repo root is the plugin, so there is no Grok marketplace: it is the same as
# `grok plugin install <this checkout> --trust`. Grok asks you to trust a
# plugin before it installs it; running this script with --grok is that
# decision, so the script passes --trust.
#
# Usage:
#   ./setup.sh                      install the libre-geo plugin
#   ./setup.sh --list               list the plugins in this pack
#   ./setup.sh --scope project      install for this project only (user|project|local)
#   ./setup.sh --uninstall          remove the plugin and marketplace
#   ./setup.sh --only libre-geo     install only the named plugins (same as the default here)
#   ./setup.sh --grok               install into Grok Build instead of Claude Code
#                                   (works with --only, --list, and --uninstall)
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANIFEST="$REPO_DIR/.claude-plugin/marketplace.json"
ONLY=""
LIST=0
UNINSTALL=0
SCOPE="user"
GROK=0

usage() { awk 'NR==1{next} /^#/{sub(/^# ?/,""); print; next} {exit}' "${BASH_SOURCE[0]}"; }

while [[ $# -gt 0 ]]; do
  case "$1" in
    --only) ONLY="${2:?--only needs a comma-separated list}"; shift 2 ;;
    --list) LIST=1; shift ;;
    --scope) SCOPE="${2:?--scope needs user, project, or local}"; shift 2 ;;
    --uninstall) UNINSTALL=1; shift ;;
    --grok) GROK=1; shift ;;
    --plugins-dir|--skills-dir)
      echo "note: $1 is no longer used; Claude Code manages plugin storage itself." >&2
      shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "unknown option: $1" >&2; usage >&2; exit 1 ;;
  esac
done

if (( GROK )); then
  command -v grok >/dev/null 2>&1 || { echo "error: the Grok Build CLI (grok) is not on PATH. Install it first: curl -fsSL https://x.ai/cli/install.sh | bash" >&2; exit 1; }
else
  command -v claude >/dev/null 2>&1 || { echo "error: the Claude Code CLI (claude) is not on PATH. Install it first: https://docs.claude.com/en/docs/claude-code" >&2; exit 1; }
fi
command -v jq >/dev/null 2>&1 || { echo "error: jq is required (sudo apt install jq / brew install jq)." >&2; exit 1; }

MARKETPLACE="$(jq -r '.name' "$MANIFEST")"
mapfile -t ALL < <(jq -r '.plugins[].name' "$MANIFEST")

if (( LIST )); then
  jq -r '.plugins[] | "\(.name)\t\(.description)"' "$MANIFEST" | column -t -s $'\t'
  exit 0
fi

SELECTED=("${ALL[@]}")
if [[ -n "$ONLY" ]]; then
  IFS=',' read -r -a SELECTED <<< "$ONLY"
  for p in "${SELECTED[@]}"; do
    printf '%s\n' "${ALL[@]}" | grep -qx "$p" || { echo "error: '$p' is not a plugin in this pack (see --list)" >&2; exit 1; }
  done
fi

if (( GROK )); then
  [[ "$SCOPE" == "user" ]] || echo "note: --scope applies to Claude Code only; Grok Build installs plugins for your user." >&2
  # Grok Build installs the root plugin straight from this folder.
  here="$(grok plugin list --json 2>/dev/null | jq -r --arg src "$REPO_DIR" '.[] | select(.source == $src) | .name' || true)"
fi

if (( GROK && UNINSTALL )); then
  for p in "${SELECTED[@]}"; do
    if grep -qx "$p" <<<"$here"; then grok plugin uninstall "$p" --confirm; fi
  done
  echo "Removed. Restart Grok Build to unload the plugin."
  exit 0
fi

if (( UNINSTALL )); then
  installed="$(claude plugin list 2>/dev/null || true)"
  for p in "${SELECTED[@]}"; do
    if grep -q "$p@$MARKETPLACE" <<<"$installed"; then claude plugin uninstall "$p@$MARKETPLACE"; fi
  done
  [[ -z "$ONLY" ]] && claude plugin marketplace remove "$MARKETPLACE" || true
  echo "Removed. Restart Claude Code to unload the plugins."
  exit 0
fi

if (( GROK )); then
  for p in "${SELECTED[@]}"; do
    if grep -qx "$p" <<<"$here"; then grok plugin update "$p"; else grok plugin install "$REPO_DIR" --trust; fi
  done
else
  if claude plugin marketplace list 2>/dev/null | grep -q "$MARKETPLACE"; then
    claude plugin marketplace update "$MARKETPLACE"
  else
    claude plugin marketplace add "$REPO_DIR"
  fi

  for p in "${SELECTED[@]}"; do
    claude plugin install "$p@$MARKETPLACE" --scope "$SCOPE"
  done
fi

# The pre-1.0 installer copied each skill folder into the user skills
# directory. Claude Code loads those too, so the skills would show up twice.
# Point them out; never delete anything here.
OLD_SKILLS_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills"
old=()
for d in "$REPO_DIR"/skills/*/; do
  n="$(basename "$d")"
  [[ -f "$OLD_SKILLS_DIR/$n/SKILL.md" ]] && old+=("$OLD_SKILLS_DIR/$n")
done
if (( ${#old[@]} > 0 )); then
  echo
  echo "note: ${#old[@]} skill folder(s) with the same names already exist in $OLD_SKILLS_DIR"
  echo "      (an install from the old setup.sh, or another copy). Claude Code loads both, so these skills"
  echo "      would appear twice. If they came from the old installer, remove them:"
  printf '        rm -rf'; printf ' "%s"' "${old[@]}"; echo
fi

echo
APP="Claude Code"; (( GROK )) && APP="Grok Build"
echo "Installed ${#SELECTED[@]} plugin(s) from $MARKETPLACE into $APP. Restart $APP to load them."
echo "Tell us what worked and what is missing: https://github.com/HermeticOrmus/LibreGEO-Claude-Code/issues/new?template=feedback.yml"
