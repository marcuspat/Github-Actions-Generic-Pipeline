# 🚀 Generic GitHub Actions Workflows

**Plug-and-play CI/CD workflows that work with any GitHub repository**

These workflows automatically detect your project type and run appropriate checks, builds, and deployments. No configuration needed - just copy the files and they'll work!

## ✨ Features

- 🔍 **Auto-detection**: Automatically detects your project type (Node.js, Python, Go, Java, Ruby, Rust, etc.)
- 🔧 **Zero configuration**: Works out of the box with sensible defaults
- 📦 **Comprehensive**: CI, testing, security, dependencies, documentation, and deployment
- 🎯 **Modular**: Use individual workflows or all together
- 🔒 **Secure**: Built-in security scanning and dependency auditing
- 📊 **Informative**: Detailed reports and summaries

## 📦 What's Included

| Workflow | Purpose | Triggers |
|----------|---------|----------|
| `generic-ci-cd.yml` | Complete CI/CD pipeline with auto-detection | Push, PR, Manual |
| `generic-dependencies.yml` | Dependency management and security audits | Schedule, Push, Manual |
| `generic-documentation.yml` | Documentation generation and deployment | Push, PR, Manual |
| `generic-deploy.yml` | Deployment to any environment | Push to main, Tags, Manual |

## 🚀 Quick Start

### 1. Copy Workflows to Your Repository

```bash
# Create workflows directory
mkdir -p .github/workflows

# Copy the workflow files
cp generic-ci-cd.yml .github/workflows/
cp generic-dependencies.yml .github/workflows/
cp generic-documentation.yml .github/workflows/
cp generic-deploy.yml .github/workflows/
```

### 2. Commit and Push

```bash
git add .github/workflows/
git commit -m "ci: add generic workflows"
git push
```

That's it! The workflows will automatically detect your project type and start running.

## 📋 Workflow Details

### 🔍 Generic CI/CD (`generic-ci-cd.yml`)

**What it does:**
- Detects your project type (Node.js, Python, Go, Java, Ruby, Rust)
- Runs appropriate linters and code quality checks
- Executes tests with coverage reporting
- Performs security scanning
- Builds artifacts for deployment

**Supported languages:**
- ✅ Node.js (npm, yarn, pnpm)
- ✅ Python (pip, poetry, pipenv)
- ✅ Go
- ✅ Java (Maven, Gradle)
- ✅ Ruby (Bundler)
- ✅ Rust (Cargo)

**When it runs:**
- Push to `main`, `develop`, or `*-dev` branches
- Pull requests to `main` or `develop`
- Manual trigger via workflow_dispatch

### 📦 Generic Dependencies (`generic-dependencies.yml`)

**What it does:**
- Checks for outdated dependencies across all package managers
- Runs security audits
- Can automatically create PRs with updates
- Generates comprehensive dependency reports

**Supported package managers:**
- npm, yarn, pnpm
- pip, poetry, pipenv
- go mod
- cargo
- bundler
- maven, gradle

**When it runs:**
- Every Monday at 9 AM UTC (configurable)
- When dependency files change
- Manual trigger

### 📚 Generic Documentation (`generic-documentation.yml`)

**What it does:**
- Collects and organizes all markdown documentation
- Generates API documentation (JSDoc, TypeDoc, Javadoc, RustDoc, GoDoc, Sphinx)
- Deploys to GitHub Pages
- Checks for broken links and linting issues

**Supported formats:**
- Markdown
- Sphinx (Python)
- MkDocs
- JSDoc (JavaScript)
- TypeDoc (TypeScript)
- Javadoc (Java)
- RustDoc (Rust)
- GoDoc (Go)

**When it runs:**
- Push to `main` or `develop` with doc changes
- Pull requests with doc changes
- Manual trigger

### 🚀 Generic Deploy (`generic-deploy.yml`)

**What it does:**
- Builds Docker images
- Deploys to any environment
- Creates GitHub releases for tags
- Sends deployment notifications

**Features:**
- Environment detection (production, staging, development)
- Docker image building and publishing to GitHub Container Registry
- Customizable deployment steps
- Health checks and rollback support
- Release notes generation

**When it runs:**
- Push to `main` branch (production)
- Tags starting with `v*` (releases)
- Manual trigger with environment selection

## ⚙️ Configuration

### Environment Variables

You can customize the workflows by editing the `env` section at the top of each file:

```yaml
env:
  NODE_VERSION: '20'           # Node.js version
  PYTHON_VERSION: '3.11'       # Python version
  GO_VERSION: '1.21'           # Go version
  JAVA_VERSION: '17'           # Java version
  ARTIFACT_RETENTION_DAYS: 30  # How long to keep artifacts
  ENABLE_SECURITY_SCAN: true   # Enable/disable security scanning
  ENABLE_CODE_COVERAGE: true   # Enable/disable coverage reports
```

### Optional: Customize Deployment

Edit `generic-deploy.yml` to add your deployment commands:

```yaml
- name: Deploy application
  run: |
    # Add your deployment commands here
    kubectl apply -f k8s/
    # or
    docker-compose up -d
    # or
    aws ecs update-service --cluster my-cluster --service my-service
```

### Optional: Enable GitHub Pages

For automatic documentation deployment:

1. Go to your repository **Settings** → **Pages**
2. Set **Source** to "GitHub Actions"
3. The documentation will be available at `https://<username>.github.io/<repository>/`

### Optional: Add Secrets

Some features require secrets. Add them in **Settings** → **Secrets and variables** → **Actions**:

- `CODECOV_TOKEN` - For code coverage reporting (optional)
- `SLACK_WEBHOOK_URL` - For Slack notifications (optional)
- `DISCORD_WEBHOOK` - For Discord notifications (optional)

## 🎯 Supported Project Structures

These workflows work with various project structures:

### Monorepo
```
project/
├── packages/
│   ├── frontend/
│   └── backend/
├── package.json          # Will be detected
└── .github/workflows/
```

### Multi-language
```
project/
├── frontend/
│   └── package.json      # Node.js detected
├── backend/
│   └── requirements.txt  # Python detected
└── .github/workflows/
```

### Simple project
```
project/
├── src/
├── package.json          # Or any dependency file
└── .github/workflows/
```

## 📊 What You'll See

### Job Summaries

Each workflow provides detailed summaries:

- ✅ Project type detection
- 📦 Found dependencies and package managers
- 🔍 Code quality results
- 🧪 Test results and coverage
- 🔒 Security scan findings
- 📚 Documentation status

### PR Comments

Automatic comments on pull requests with:

- Overall pipeline status
- Links to detailed results
- Artifact downloads
- Next steps

### Artifacts

Downloaded artifacts include:

- Build artifacts (production-ready code)
- Test results and coverage reports
- Security scan reports
- Documentation bundles
- Deployment manifests

## 🔧 Customization Examples

### Add a language

To add support for a new language, add detection in the `detect-project` job:

```yaml
- name: Detect project structure
  run: |
    # Add your language detection
    if [ -f "composer.json" ]; then
      echo "has-php=true" >> $GITHUB_OUTPUT
      echo "✅ PHP project detected"
    fi
```

### Change branch names

Update the `on` section to match your branch naming:

```yaml
on:
  push:
    branches:
      - main
      - staging    # Your staging branch
      - dev        # Your dev branch
```

### Add custom tests

Add a step in the `test` job:

```yaml
- name: Run custom tests
  run: |
    ./scripts/run-custom-tests.sh
```

### Customize notifications

Add notification services in `generic-deploy.yml`:

```yaml
- name: Slack notification
  uses: slackapi/slack-github-action@v1
  with:
    webhook-url: ${{ secrets.SLACK_WEBHOOK }}
```

## 🐛 Troubleshooting

### Workflows not running?

1. Check that files are in `.github/workflows/` directory
2. Verify YAML syntax is correct
3. Check repository permissions (Settings → Actions → General)
4. Ensure branch names match the workflow triggers

### Missing dependencies?

The workflows will detect and install dependencies automatically. If something's missing:

1. Check the detection logic in the workflow
2. Add your dependency files to the repository
3. The workflow will pick them up on the next run

### Docker build failing?

Make sure you have a `Dockerfile` in your repository root. If you don't need Docker:

1. The workflow will skip Docker builds automatically
2. Or disable the build-docker job by adding `if: false`

### Documentation not deploying?

1. Enable GitHub Pages in repository settings
2. Set source to "GitHub Actions"
3. Ensure you have markdown files in your repository

## 📝 Best Practices

1. **Use semantic versioning** for tags (`v1.0.0`, `v1.0.1`)
2. **Write meaningful commit messages** (helps with changelog generation)
3. **Keep dependencies updated** (the workflow will help!)
4. **Document your code** (workflows will build and deploy docs)
5. **Review security alerts** (workflows will flag vulnerabilities)

## 🔄 Updates

These workflows are designed to be low-maintenance:

- They detect changes in your project automatically
- They handle new dependencies without configuration
- They adapt to your project structure

To update the workflows:

```bash
# Just copy new versions over the old ones
cp new-generic-ci-cd.yml .github/workflows/generic-ci-cd.yml
git commit -m "ci: update workflows"
git push
```

## 🤝 Contributing

Found a bug? Want to add a feature?

1. The workflows are designed to be generic - ensure changes work for all project types
2. Test with multiple languages/frameworks
3. Keep auto-detection logic simple and reliable
4. Add clear comments for any complex logic

## 📜 License

These workflows are provided as-is for use in any project. Feel free to modify and distribute.

## 🎓 Examples

### Example 1: Node.js Project

1. Copy workflows to your Next.js/React/Vue project
2. Workflows automatically detect `package.json`
3. Runs npm install, lint, test, and build
4. Deploys to your infrastructure

### Example 2: Python Project

1. Copy workflows to your Flask/Django/FastAPI project
2. Workflows automatically detect `requirements.txt`
3. Runs pip install, flake8, pytest
4. Generates documentation with Sphinx

### Example 3: Multi-language Project

1. Copy workflows to your full-stack project
2. Workflows detect both frontend (Node.js) and backend (Python)
3. Runs appropriate checks for each
4. Builds and deploys both components

## 🚨 Important Notes

- **First run may take longer** as workflows set up caches
- **Some jobs may be skipped** if the project type isn't detected
- **Manual customization may be needed** for complex deployment scenarios
- **Secrets are required** for some features (CodeCov, notifications)

## 📞 Need Help?

- Check the workflow logs in the Actions tab
- Review the job summaries for details
- Most issues are self-explanatory in the output

## ✅ Checklist

Before you start:

- [ ] Workflows copied to `.github/workflows/`
- [ ] Files committed and pushed
- [ ] Actions enabled in repository settings
- [ ] GitHub Pages configured (if using docs)
- [ ] Secrets added (if needed)
- [ ] Deployment steps customized (if needed)

After first run:

- [ ] Review job summaries
- [ ] Check for any warnings
- [ ] Download artifacts to verify builds
- [ ] Test manual workflow triggers
- [ ] Customize as needed

---

**🎉 That's it! Your repository now has professional CI/CD workflows that work out of the box!**
