# Quick Setup Guide

Get your GitHub Actions workflows running in minutes!

## 📋 Prerequisites

- A GitHub repository
- GitHub Actions enabled (enabled by default on new repos)

## 🚀 Installation

### Option 1: Quick Copy (Recommended)

1. **Download the workflows**
   ```bash
   # Clone or download this workflow package
   git clone <this-repo-url> github-workflows
   ```

2. **Copy to your project**
   ```bash
   cd your-project
   mkdir -p .github/workflows
   cp path/to/github-workflows/*.yml .github/workflows/
   ```

3. **Commit and push**
   ```bash
   git add .github/workflows/
   git commit -m "ci: add GitHub Actions workflows"
   git push
   ```

4. **Done!** 🎉 Workflows will start running automatically

### Option 2: Manual Setup

1. Create `.github/workflows/` directory in your repository
2. Copy each `.yml` file into that directory
3. Commit and push

## ⚙️ Configuration (Optional)

### Basic Configuration

The workflows work out-of-the-box with zero configuration. They auto-detect:
- Project type (Node.js, Python, Docker)
- Available tests
- Documentation structure

### Advanced Configuration

#### 1. Customize Deployment URLs

Create `.github/deploy-config.json`:
```json
{
  "environments": {
    "production": {
      "url": "https://app.yourdomain.com"
    },
    "staging": {
      "url": "https://staging.yourdomain.com"
    },
    "development": {
      "url": "https://dev.yourdomain.com"
    }
  }
}
```

#### 2. Configure GitHub Environments

For protected deployments:

1. Go to **Settings** → **Environments**
2. Create environments: `production`, `staging`, `development`
3. Add protection rules:
   - Required reviewers
   - Wait timer
   - Deployment branches
4. Add environment secrets:
   - Database credentials
   - API keys
   - Service tokens

#### 3. Enable GitHub Pages (for documentation)

1. Go to **Settings** → **Pages**
2. Source: **GitHub Actions**
3. Visit `https://[username].github.io/[repository]` after first deploy

#### 4. Add Optional Secrets

Go to **Settings** → **Secrets and variables** → **Actions**:

| Secret | Purpose | Required? |
|--------|---------|-----------|
| `CODECOV_TOKEN` | Code coverage reports | No |
| `SLACK_WEBHOOK_URL` | Slack notifications | No |
| `DISCORD_WEBHOOK_URL` | Discord notifications | No |
| Custom deployment secrets | Your infrastructure | Depends on setup |

## 🎯 Workflow Triggers

### CI Pipeline (`ci.yml`)
- ✅ Runs on: Push to any branch
- ✅ Runs on: Pull requests to main/develop
- ⚙️ Tests, lints, and builds your code

### Branch Management (`branch-management.yml`)
- ✅ Runs on: Branch creation
- ✅ Runs on: Push to `*-dev` branches
- ✅ Runs on: Pull requests
- ⚙️ Sets up branch structure and validates PRs

### Dependencies (`dependencies.yml`)
- ✅ Runs on: Weekly schedule (Mondays at 9 AM UTC)
- ✅ Runs on: Changes to dependency files
- ✅ Manual trigger available
- ⚙️ Checks for updates and security issues

### Documentation (`documentation.yml`)
- ✅ Runs on: Changes to `.md` files or docs directories
- ✅ Manual trigger available
- ⚙️ Builds and deploys documentation site

### Deploy (`deploy.yml`)
- ✅ Runs on: Push to `main` (production)
- ✅ Runs on: Push to `develop` (staging)
- ✅ Runs on: Version tags (`v*`)
- ⚙️ Deploys your application

## 🔧 Customizing Workflows

### Modify Language Versions

Edit environment variables at the top of workflows:

```yaml
env:
  NODE_VERSION: '20'      # Change to '18' or '21'
  PYTHON_VERSION: '3.11'  # Change to '3.10' or '3.12'
```

### Add Custom Build Steps

Edit the `ci.yml` workflow and add steps to the build jobs:

```yaml
- name: Custom build step
  run: |
    echo "Add your custom commands here"
    # npm run custom-script
    # python custom_script.py
```

### Customize Deployment

Edit `deploy.yml` and add your deployment commands in the "Deploy" step:

```yaml
- name: Deploy
  run: |
    # Add your deployment commands
    kubectl apply -f k8s/
    # or
    ./scripts/deploy.sh ${{ needs.prepare-deployment.outputs.environment }}
```

## 🌿 Branch Workflow

### Personal Development Branches

Create branches ending in `-dev` for personal work:
```bash
git checkout -b john-dev
git push -u origin john-dev
```

This automatically creates:
```
├── research/    # Document your research
├── planning/    # Plan your implementation
├── process/     # Document your workflow
├── tools/       # Track tools and libraries
└── WELCOME.md   # Getting started guide
```

### Feature Branches

For collaborative features:
```bash
git checkout -b feature/user-authentication
```

### Release Workflow

1. Develop on `develop` branch
2. Create PR to `main` for production
3. Tag releases: `git tag v1.0.0`
4. Push tags: `git push --tags`

## 📊 Viewing Results

### GitHub Actions Tab
- Click **Actions** tab in your repository
- View workflow runs and their status
- Click individual runs for detailed logs

### Pull Request Checks
- Checks appear automatically on PRs
- Green checkmark = passed
- Red X = failed (click for details)

### Documentation Site
- Available at `https://[username].github.io/[repository]`
- Updates automatically from `main` branch

### Artifacts
- Built files available in workflow runs
- Download from Actions tab → Workflow run → Artifacts
- Retained for 30 days by default

## 🐛 Troubleshooting

### Workflows Not Running?

**Check 1:** Actions enabled?
- Settings → Actions → General
- Ensure "Allow all actions" is selected

**Check 2:** Files in correct location?
```bash
# Should be in .github/workflows/
ls -la .github/workflows/
```

**Check 3:** YAML syntax correct?
- Use [YAML Lint](http://www.yamllint.com/) to validate
- Check for proper indentation (use spaces, not tabs)

### Build Failing?

**Node.js:**
```bash
# Test locally first
npm ci
npm run build
npm test
```

**Python:**
```bash
# Test locally first
pip install -r requirements.txt
pytest
```

### Deployment Not Working?

1. **Check deployment commands** in `deploy.yml`
2. **Verify environment secrets** are set
3. **Review deployment logs** in Actions tab
4. **Ensure infrastructure is accessible** from GitHub Actions runners

### Need Help?

1. Check workflow logs in Actions tab
2. Review job summaries for specific errors
3. Common issues:
   - Missing dependencies in `package.json` or `requirements.txt`
   - Incorrect file paths
   - Missing environment variables
   - Network/infrastructure access issues

## 🎓 Best Practices

### 1. Start Simple
- Let workflows auto-detect initially
- Add customization as needed
- Don't over-engineer early

### 2. Use Conventional Commits
```
feat: add user authentication
fix: resolve login redirect issue
docs: update API documentation
test: add user service tests
```

### 3. Document First, Code Second
- Use personal dev branches (`*-dev`)
- Fill in research/ and planning/ directories
- Document decisions and reasoning

### 4. Test Locally
- Run tests locally before pushing
- Verify builds work locally
- This saves CI/CD minutes

### 5. Monitor and Iterate
- Review workflow results regularly
- Adjust based on your needs
- Remove unused features

## 📚 Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Workflow Syntax Reference](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- [GitHub Environments](https://docs.github.com/en/actions/deployment/targeting-different-environments)
- [Encrypted Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)

## 🔄 Updating Workflows

To update workflows:
1. Download new versions
2. Replace files in `.github/workflows/`
3. Review changes in git diff
4. Test on a feature branch first
5. Merge when confident

## 💬 Feedback

Found an issue or have a suggestion? File an issue in this repository or open a discussion!

---

**Happy automating! 🚀**
