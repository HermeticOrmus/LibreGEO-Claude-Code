#!/usr/bin/env bash
# LibreGEO-Claude-Code installer.
# Copies the 12 GEO skills into your Claude Code skills directory.
#
# Usage: ./setup.sh [--skills-dir <path>]
#
# Default skills dir: $CLAUDE_SKILLS_DIR or ~/.claude/skills

set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"
SKILLS_DST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

while (( $# )); do
  case "$1" in
    --skills-dir) SKILLS_DST="$2"; shift 2;;
    -h|--help)
      echo "Usage: $0 [--skills-dir <path>]"
      echo "  Default skills dir: \$CLAUDE_SKILLS_DIR or ~/.claude/skills"
      exit 0;;
    *) echo "Unknown arg: $1" >&2; exit 64;;
  esac
done

if [[ ! -d "$SKILLS_SRC" ]]; then
  echo "ERROR: skills source not found at $SKILLS_SRC" >&2
  echo "Run from the repo root." >&2
  exit 1
fi

mkdir -p "$SKILLS_DST"

echo "Installing LibreGEO skills:"
echo "  Source: $SKILLS_SRC"
echo "  Target: $SKILLS_DST"
echo ""

count=0
for skill_dir in "$SKILLS_SRC"/*/; do
  skill_name="$(basename "$skill_dir")"
  target="$SKILLS_DST/$skill_name"

  if [[ -d "$target" ]]; then
    echo "  [skip] $skill_name (already installed — remove first to reinstall)"
    continue
  fi

  cp -r "$skill_dir" "$target"
  echo "  [ok]   $skill_name"
  count=$((count + 1))
done

echo ""
echo "Installed $count skills."
echo ""
echo "Try it out:"
echo "  /geo-audit https://your-site.com"
echo ""
echo "Documentation: see QUICK_START.md or beginner/README.md"
