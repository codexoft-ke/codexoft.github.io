#!/bin/bash

# List of remotes and their corresponding CNAME content
declare -A remote_cnames
remote_cnames["me"]="codexoft.me"
remote_cnames["tech"]="codexoft.tech"

# Commit message passed as an argument
commit_message=$1

if [ -z "$commit_message" ]; then
  echo "Error: Please provide a commit message."
  echo "Usage: ./push.sh 'Your commit message'"
  exit 1
fi

# Push to each remote with appropriate CNAME
for remote in "${!remote_cnames[@]}"; do
  echo "Setting up CNAME for $remote..."
  echo "${remote_cnames[$remote]}" > CNAME
  
  # Stage CNAME and all changes
  git add .
  
  # Commit changes
  git commit -m "$commit_message"
  
  echo "Pushing to $remote..."
  git push "$remote" main -f
done

echo "Push completed to all repositories."
