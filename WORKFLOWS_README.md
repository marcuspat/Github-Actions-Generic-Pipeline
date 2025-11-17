# Generic GitHub Actions Workflows

A comprehensive, plug-and-play CI/CD workflow system for any GitHub repository.

## 🚀 Quick Start

1. Copy the `.github/workflows/` directory to your repository
2. Push to GitHub
3. The workflows will automatically detect your project type and run appropriate checks

No configuration required! The workflows auto-detect:
- Node.js projects (package.json)
- Python projects (requirements.txt, pyproject.toml)
- Docker projects (Dockerfile)
- Documentation (*.md files)

## 📦 Included Workflows

### 1. **ci.yml** - Continuous Integration
Runs on: Push to any branch, Pull Requests to main/develop

**Features:**
- Auto-detects project languages (Node.js, Python)
- Code quality checks and linting
- Automated testing with coverage reports
- Security scanning with Trivy
- Artifact building and preservation

### 2. **branch-management.yml** - Branch Organization
Runs on: Branch creation, Push to *-dev branches, Pull Requests

**Features:**
- Validates branch naming conventions
- Auto-setup for personal dev branches (*-dev)
- Creates documentation structure (research, planning, process, tools)
- Generates branch statistics and documentation coverage reports
- PR readiness checks

### 3. **dependencies.yml** - Dependency Management
Runs on: Weekly schedule (Mondays 9 AM UTC), Manual trigger, Dependency file changes

**Features:**
- Checks for outdated packages (npm and pip)
- Security audits (npm audit, Python safety)
- License compliance checking
- Auto-creates PRs with dependency updates
- Dependency graph generation

### 4. **documentation.yml** - Documentation Pipeline
Runs on: Push/PR with doc changes, Manual trigger

**Features:**
- Markdown linting
- Broken link detection
- Spell checking (optional)
- Collects and organizes documentation
- Generates API docs (JSDoc, Sphinx)
- Builds documentation site with MkDocs
- Deploys to GitHub Pages (on main branch)

### 5. **deploy.yml** - Deployment Pipeline
Runs on: Push to main/develop, Version tags (v*)

**Features:**
- Environment detection (production, staging, development)
- Docker image building and pushing to GHCR
- Multi-service deployment support
- Smoke tests after deployment
- GitHub release creation for tags
- Deployment notifications

## 🎯 Branch Naming Conventions

The workflows support these patterns:
- `main` - Production branch
- `develop` - Development branch
- `feature/*` - Feature branches
- `bugfix/*` - Bug fix branches
- `hotfix/*` - Hot fix branches
- `*-dev` - Personal development branches (auto-setup with structure)

## 🔧 Customization

### Optional: Add Configuration File

Create `.github/workflows/config.yml` to customize behavior:

```yaml
# Workflow configuration (optional)
config:
  # Language versions
  node_version: '20'
  python_version: '3.11'
  
  # Artifact retention
  artifact_retention_days: 30
  
  # Deployment URLs (customize for your infrastructure)
  deployment:
    production: https://app.yourdomain.com
    staging: https://staging.yourdomain.com
    development: https://dev.yourdomain.com
  
  # Notifications (add your webhooks)
  notifications:
    slack_webhook: ${{ secrets.SLACK_WEBHOOK }}
    discord_webhook: ${{ secrets.DISCORD_WEBHOOK }}
```

### Environment-Specific Deployments

The deploy workflow uses GitHub Environments. Configure them in your repository:
1. Go to Settings → Environments
2. Create environments: `production`, `staging`, `development`
3. Add protection rules and secrets as needed

## 📋 Required Secrets (Optional)

These secrets are optional but enable additional features:

- `CODECOV_TOKEN` - For code coverage reports
- `SLACK_WEBHOOK` - For deployment notifications
- `DISCORD_WEBHOOK` - For deployment notifications

The workflows work without these secrets using fallback behavior.

## 🎨 Personal Development Branches

When you create a branch ending in `-dev` (e.g., `john-dev`, `sarah-dev`):

1. **Auto-setup runs** - Creates recommended structure:
   ```
   ├── research/     # Document findings and investigations
   ├── planning/     # Implementation plans and specs
   ├── process/      # Development workflow and methodology
   ├── tools/        # Tools, libraries, and frameworks
   ├── src/          # Your implementation code
   └── WELCOME.md    # Quick start guide
   ```

2. **Documentation-first approach** - Encourages planning before coding

3. **Progress tracking** - Each push generates statistics:
   - File counts by type
   - Directory structure
   - Recent commits
   - Documentation coverage score

## 🧪 Testing Integration

The workflows automatically detect and run tests:

**Node.js:**
- Runs `npm test` if script exists
- Supports Jest, Mocha, and other test runners

**Python:**
- Runs pytest with coverage
- Uploads coverage to Codecov

## 🐳 Docker Support

If Dockerfiles are detected:
- Builds images for each service
- Pushes to GitHub Container Registry (ghcr.io)
- Tags with branch name, commit SHA, and version
- Creates deployment packages if no Dockerfile found

## 📚 Documentation Site

On the `main` branch, documentation is automatically:
1. Collected from all markdown files
2. Organized by category (research, planning, process, tools)
3. Built into a beautiful MkDocs site
4. Deployed to GitHub Pages

**Access your docs at:** `https://[username].github.io/[repository]`

## 🔒 Security Features

- Trivy vulnerability scanning on every push
- npm audit for Node.js dependencies
- Safety check for Python dependencies
- Secret scanning in files
- License compliance checking
- SARIF reports uploaded to GitHub Security

## 💡 Best Practices

### Commit Messages
Use conventional commits for better automation:
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `style:` - Code style changes
- `refactor:` - Code refactoring
- `test:` - Test changes
- `chore:` - Maintenance tasks

### Pull Requests
The PR readiness check verifies:
- Research documentation exists
- Tests are present
- Conventional commit format
- PR description provided

## 🆘 Troubleshooting

### Workflows not running?
- Ensure workflows are in `.github/workflows/` directory
- Check that Actions are enabled in repository settings
- Verify branch protection rules aren't blocking workflow runs

### Deployment failing?
- Check that GitHub Environments are configured
- Verify deployment secrets are set
- Review the deployment step logs for specific errors

### Missing features?
Some features require setup:
- **GitHub Pages**: Enable in repository Settings → Pages
- **Environments**: Configure in Settings → Environments
- **Container Registry**: Ensure packages are enabled for your account

## 🔄 Updates

These workflows are self-contained and require no external dependencies to run. Update by replacing the workflow files with newer versions.

## 📄 License

These workflows are provided as-is for use in any project. Modify as needed for your use case.

## 🤝 Contributing

Suggestions for improvements:
1. Fork this workflow collection
2. Make your changes
3. Test in a sample repository
4. Submit feedback or share your improvements

---

**Made with ❤️ for developers who want to focus on code, not CI/CD configuration**
