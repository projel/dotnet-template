#!/bin/sh

# This script is a Husky pre-commit hook that prevents commits to protected branches.
# Protected branches are defined in the PROTECTED_BRANCHES variable.
PROTECTED_BRANCHES=("main" "master" "develop" "production")

# Se não houver nenhum commit ainda, não faz a checagem
if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
    echo "🆕 Nenhum commit ainda — pulando verificação de branch protegida."
    exit 0
fi

# Verifica se o branch atual está protegido
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
for BRANCH in "${PROTECTED_BRANCHES[@]}"; do
  if [ "$CURRENT_BRANCH" = "$BRANCH" ]; then
    echo "Error: Commits to the '$BRANCH' branch are protected. Please switch to a different branch."
    exit 1
  fi
done