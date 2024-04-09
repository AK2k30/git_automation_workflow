#!/bin/bash

# Configure your default username and email if not already done
git config --global user.name "Akash Singh"
git config --global user.email "akashsunilsingh5555@gmail.com"

# Initialize a new Git repository
git init

# Add all files to the staging area
git add .

# Commit the changes
echo "Enter commit message:"
read commitMessage
git commit -m "$commitMessage"

# This section is commented out since the repository is assumed to already exist
# echo "Creating a new repository on GitHub..."
# gh repo create YOUR_USERNAME/REPO_NAME --private --source=.

# Replace 'your_remote_repo_url' with the actual URL of your GitHub repository
git remote add origin https://github.com/AK2k30/git_automation_workflow.git

# Determine the current branch (Git 2.22 and above)
currentBranch=$(git branch --show-current)

# Push the changes to the remote repository on the current branch
git push -u origin $currentBranch
