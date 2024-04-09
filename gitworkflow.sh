#!/bin/bash

# Load .env file
if [ -f .env ]; then
    export $(cat .env | sed 's/#.*//g' | xargs)
fi

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

# Check if the remote 'origin' already exists
if git remote get-url origin > /dev/null 2>&1; then
    echo "Remote 'origin' already exists. Using existing repository..."
    repoURL=$(git remote get-url origin)
else
    # Prompt for the user's choice to create a new repository
    echo "Do you want to create a new GitHub repository? (y/n):"
    read createRepoChoice
    
    if [ "$createRepoChoice" = "y" ]; then
        # Prompt for new repository details
        echo "Enter your GitHub username:"
        read githubUsername
        echo "Enter your new GitHub repository name:"
        read repoName
        
        # Create a new repository using GitHub CLI
        # Ensure gh is logged in and configured beforehand
        gh repo create $githubUsername/$repoName --public --source=. --confirm
        repoURL="https://github.com/$githubUsername/$repoName.git"
    else
        # Prompt for the GitHub repository URL
        echo "Enter your GitHub repository URL (e.g., https://github.com/AK2k30/git_automation_workflow.git):"
        read repoURL
        
        # Add remote repository URL
        git remote add origin $repoURL
    fi
fi

# Determine the current branch (Git 2.22 and above)
currentBranch=$(git branch --show-current)

# Push the changes to the remote repository on the current branch
git push -u origin $currentBranch
