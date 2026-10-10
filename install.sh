#!/usr/bin/env bash
# Install the anti-ai-writing skill.
# Usage: ./install.sh [claude|codex|all] [--project]
#   claude    -> ~/.claude/skills/anti-ai-writing   (Claude Code, Cowork, Claude desktop CLI)
#   codex     -> ~/.codex/skills/anti-ai-writing    (OpenAI Codex CLI)
#   all       -> both
#   --project installs into ./.claude/skills or ./.codex/skills instead of your home folder
set -euo pipefail

TARGET="${1:-claude}"
SCOPE="home"
[[ "${2:-}" == "--project" || "${1:-}" == "--project" ]] && SCOPE="project"
[[ "$TARGET" == "--project" ]] && TARGET="claude"

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/anti-ai-writing"
[[ -f "$SRC/SKILL.md" ]] || { echo "Cannot find $SRC/SKILL.md. Run this from the cloned repo." >&2; exit 1; }

install_to() {
  local base="$1" dest="$1/skills/anti-ai-writing"
  mkdir -p "$base/skills"
  rm -rf "$dest"
  cp -R "$SRC" "$dest"
  echo "Installed to $dest"
}

root() { [[ "$SCOPE" == "project" ]] && echo "$PWD/$1" || echo "$HOME/$1"; }

case "$TARGET" in
  claude) install_to "$(root .claude)" ;;
  codex)  install_to "$(root .codex)" ;;
  all)    install_to "$(root .claude)"; install_to "$(root .codex)" ;;
  *) echo "Unknown target '$TARGET'. Use: claude | codex | all" >&2; exit 1 ;;
esac

echo "Done. Restart your agent if it was already running, then say: \"anti-ai-writing this\"."
