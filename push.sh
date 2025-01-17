#!/bin/bash

# List of remotes
remotes=("me" "tech")

# Commit message passed as an argument
commit_message=$1

if [ -z "$commit_message" ]; then
  echo "Error: Please provide a commit message."
  echo "Usage: ./push.sh 'Your commit message'"
  exit 1
fi

# Stage all changes
git add .

# Commit changes
git commit -m "$commit_message"

# Push to each remote
for remote in "${remotes[@]}"; do
  echo "Pushing to $remote..."
  git push "$remote" master -f
done

echo "Push completed to all repositories."
