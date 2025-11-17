#!/bin/bash

# Generic GitHub Actions Workflows - Setup Script
# This script helps you quickly add the workflows to your repository

set -e

echo "🚀 Generic GitHub Actions Workflows Setup"
echo "=========================================="
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not in a git repository"
    echo "   Please run this script from the root of your git repository"
    exit 1
fi

echo "📁 Current directory: $(pwd)"
echo ""

# Create workflows directory
echo "📂 Creating .github/workflows directory..."
mkdir -p .github/workflows

# Check which workflows to install
echo ""
echo "Which workflows would you like to install?"
echo ""
echo "1) All workflows (recommended)"
echo "2) CI/CD only"
echo "3) Dependencies only"
echo "4) Documentation only"
echo "5) Deploy only"
echo "6) Custom selection"
echo ""
read -p "Enter your choice (1-6): " choice

install_all=false
install_ci=false
install_deps=false
install_docs=false
install_deploy=false

case $choice in
    1)
        install_all=true
        ;;
    2)
        install_ci=true
        ;;
    3)
        install_deps=true
        ;;
    4)
        install_docs=true
        ;;
    5)
        install_deploy=true
        ;;
    6)
        echo ""
        read -p "Install CI/CD workflow? (y/n): " -n 1 -r
        echo
        [[ $REPLY =~ ^[Yy]$ ]] && install_ci=true
        
        read -p "Install Dependencies workflow? (y/n): " -n 1 -r
        echo
        [[ $REPLY =~ ^[Yy]$ ]] && install_deps=true
        
        read -p "Install Documentation workflow? (y/n): " -n 1 -r
        echo
        [[ $REPLY =~ ^[Yy]$ ]] && install_docs=true
        
        read -p "Install Deploy workflow? (y/n): " -n 1 -r
        echo
        [[ $REPLY =~ ^[Yy]$ ]] && install_deploy=true
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "📋 Installing workflows..."
echo ""

# Function to copy workflow
copy_workflow() {
    local source=$1
    local dest=$2
    local name=$3
    
    if [ -f "$source" ]; then
        cp "$source" "$dest"
        echo -e "${GREEN}✅${NC} Installed: $name"
    else
        echo -e "${YELLOW}⚠️${NC}  Skipped: $name (source file not found)"
    fi
}

# Install workflows based on selection
if [ "$install_all" = true ]; then
    copy_workflow "generic-ci-cd.yml" ".github/workflows/ci-cd.yml" "CI/CD Pipeline"
    copy_workflow "generic-dependencies.yml" ".github/workflows/dependencies.yml" "Dependency Management"
    copy_workflow "generic-documentation.yml" ".github/workflows/documentation.yml" "Documentation"
    copy_workflow "generic-deploy.yml" ".github/workflows/deploy.yml" "Deployment"
else
    [ "$install_ci" = true ] && copy_workflow "generic-ci-cd.yml" ".github/workflows/ci-cd.yml" "CI/CD Pipeline"
    [ "$install_deps" = true ] && copy_workflow "generic-dependencies.yml" ".github/workflows/dependencies.yml" "Dependency Management"
    [ "$install_docs" = true ] && copy_workflow "generic-documentation.yml" ".github/workflows/documentation.yml" "Documentation"
    [ "$install_deploy" = true ] && copy_workflow "generic-deploy.yml" ".github/workflows/deploy.yml" "Deployment"
fi

echo ""
echo "🎯 Detecting your project type..."
echo ""

# Detect project type
detected_types=()

[ -f "package.json" ] && detected_types+=("Node.js")
[ -f "requirements.txt" ] || [ -f "pyproject.toml" ] && detected_types+=("Python")
[ -f "go.mod" ] && detected_types+=("Go")
[ -f "Cargo.toml" ] && detected_types+=("Rust")
[ -f "pom.xml" ] || [ -f "build.gradle" ] && detected_types+=("Java")
[ -f "Gemfile" ] && detected_types+=("Ruby")

if [ ${#detected_types[@]} -eq 0 ]; then
    echo "ℹ️  No specific project type detected"
    echo "   The workflows will run basic checks"
else
    echo -e "${GREEN}✅ Detected:${NC} ${detected_types[*]}"
fi

echo ""
echo "📝 Next steps:"
echo ""
echo "1. Review the installed workflows in .github/workflows/"
echo "2. Commit the changes:"
echo -e "   ${BLUE}git add .github/workflows/${NC}"
echo -e "   ${BLUE}git commit -m \"ci: add GitHub Actions workflows\"${NC}"
echo -e "   ${BLUE}git push${NC}"
echo ""
echo "3. Optional customizations:"
echo "   - Update language versions in workflow files"
echo "   - Add deployment commands in deploy.yml"
echo "   - Configure secrets in GitHub repository settings"
echo ""
echo "4. Enable GitHub Pages (for documentation):"
echo "   - Go to Settings → Pages"
echo "   - Set Source to 'GitHub Actions'"
echo ""

read -p "Would you like to commit these changes now? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo "📦 Committing workflows..."
    git add .github/workflows/
    git commit -m "ci: add GitHub Actions workflows

- Add generic CI/CD workflows
- Auto-detect project type
- Include dependency management
- Add documentation generation
- Configure deployment pipeline"
    
    echo ""
    echo -e "${GREEN}✅ Committed!${NC}"
    echo ""
    read -p "Would you like to push to remote? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        current_branch=$(git branch --show-current)
        echo ""
        echo "📤 Pushing to $current_branch..."
        git push origin "$current_branch"
        echo ""
        echo -e "${GREEN}✅ Pushed!${NC}"
        echo ""
        echo "🎉 Setup complete! Check the Actions tab in your GitHub repository."
    fi
else
    echo ""
    echo "👍 No problem! Commit when you're ready:"
    echo -e "   ${BLUE}git add .github/workflows/${NC}"
    echo -e "   ${BLUE}git commit -m \"ci: add workflows\"${NC}"
    echo -e "   ${BLUE}git push${NC}"
fi

echo ""
echo "📚 For more information, see the README.md file"
echo ""
echo "✨ Happy coding!"
