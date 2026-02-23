#!/usr/bin/env bash
# post-edit-lint.sh — Runs the project's linter on edited files after Edit/Write/MultiEdit
# Fired by PostToolUse hook. Reads tool result JSON from stdin.

set -euo pipefail

# Require jq for JSON parsing — exit gracefully if not available
if ! command -v jq &>/dev/null; then
  exit 0
fi

# Read stdin JSON and extract the file path
input=$(cat)
file=$(echo "$input" | jq -r '.tool_input.file_path // .tool_input.path // empty' 2>/dev/null)

# No file path found — nothing to lint
if [[ -z "$file" ]]; then
  exit 0
fi

# Security: reject paths with traversal or absolute paths
if [[ "$file" == *".."* ]] || [[ "$file" == /* ]]; then
  echo "Skipping lint: unsafe file path"
  exit 0
fi

# Security: verify the file exists and is a regular file
if [[ ! -f "$file" ]]; then
  exit 0
fi

# Detect and run the appropriate linter
if [[ -f "eslint.config.js" ]] || [[ -f "eslint.config.mjs" ]] || [[ -f "eslint.config.cjs" ]] || [[ -f ".eslintrc.js" ]] || [[ -f ".eslintrc.json" ]] || [[ -f ".eslintrc.yml" ]] || [[ -f ".eslintrc.yaml" ]]; then
  # ESLint — only lint JS/TS files
  case "$file" in
    *.js|*.jsx|*.ts|*.tsx|*.mjs|*.cjs|*.vue|*.svelte)
      npx eslint "$file" 2>&1 || true
      ;;
  esac
elif [[ -f ".rubocop.yml" ]]; then
  # RuboCop — only lint Ruby files
  case "$file" in
    *.rb|*.rake|*.gemspec)
      bundle exec rubocop "$file" --format simple 2>&1 || true
      ;;
    Gemfile|Rakefile)
      bundle exec rubocop "$file" --format simple 2>&1 || true
      ;;
  esac
elif [[ -f "ruff.toml" ]] || [[ -f "pyproject.toml" ]]; then
  # Ruff — only lint Python files
  case "$file" in
    *.py)
      ruff check "$file" 2>&1 || true
      ;;
  esac
fi

exit 0
