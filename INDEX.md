# 📦 Generic GitHub Actions Workflows - Complete Package

**Version**: 1.0.0  
**Last Updated**: November 2024  
**License**: MIT (Use freely in any project)

## 📁 Package Contents

This package contains everything you need to add professional CI/CD workflows to any GitHub repository.

### 🚀 Main Workflow Files

| File | Purpose | Size | Triggers |
|------|---------|------|----------|
| `generic-ci-cd.yml` | Complete CI/CD pipeline with auto-detection | 24KB | Push, PR, Manual |
| `generic-dependencies.yml` | Dependency management & security audits | 14KB | Schedule, Push, Manual |
| `generic-documentation.yml` | Documentation generation & GitHub Pages | 18KB | Push, PR, Manual |
| `generic-deploy.yml` | Deployment automation | 15KB | Push to main, Tags, Manual |

### 📚 Documentation Files

| File | Purpose |
|------|---------|
| `README.md` | Complete documentation with all features and setup |
| `QUICKSTART.md` | Get started in 2 minutes |
| `setup.sh` | Interactive setup script |

### 🔧 Original Workflows (Reference)

These were your original workflows that inspired the generic versions:

- `branch-management.yml` - Branch naming and personal dev branches
- `ci.yml` - Original CI pipeline
- `dependencies.yml` - Original dependency management
- `deploy.yml` - Original deployment
- `documentation.yml` - Original documentation

## 🎯 What Makes These Workflows "Generic"?

### ✨ Key Features

1. **🔍 Auto-Detection**
   - Automatically identifies your project type
   - Detects all package managers
   - Finds documentation formats
   - No configuration needed

2. **🌐 Universal Support**
   - Works with any language/framework
   - Supports multiple languages in one repo
   - Handles monorepos
   - Adapts to any project structure

3. **📦 Zero Configuration**
   - Copy files and go
   - Sensible defaults for everything
   - Gracefully skips unsupported features
   - No breaking changes to existing setups

4. **🔒 Security First**
   - Built-in security scanning
   - Dependency vulnerability checks
   - Secret detection
   - SARIF report uploads

5. **📊 Comprehensive Reporting**
   - Detailed job summaries
   - Artifact generation
   - PR comments
   - Download links

## 🚀 Installation

### Quick Install (Recommended)

```bash
# Using the setup script
chmod +x setup.sh
./setup.sh
```

### Manual Install

```bash
mkdir -p .github/workflows
cp generic-*.yml .github/workflows/
git add .github/workflows/
git commit -m "ci: add generic workflows"
git push
```

## 🎓 Supported Technologies

### Languages & Frameworks

✅ **Node.js**
- npm, yarn, pnpm
- ESLint, Prettier
- Jest, Mocha, Vitest
- Next.js, React, Vue, etc.

✅ **Python**
- pip, poetry, pipenv
- flake8, pylint, black, isort
- pytest, unittest
- Django, Flask, FastAPI, etc.

✅ **Go**
- go mod
- golangci-lint, gofmt
- go test
- Any Go project

✅ **Java**
- Maven, Gradle
- Checkstyle, PMD
- JUnit
- Spring Boot, etc.

✅ **Ruby**
- Bundler
- RuboCop
- RSpec, Minitest
- Rails, etc.

✅ **Rust**
- Cargo
- rustfmt, clippy
- cargo test
- Any Rust project

### Infrastructure

✅ **Docker** - Automatic image building and publishing  
✅ **Kubernetes** - Deployment ready  
✅ **Terraform** - Detection and validation  
✅ **GitHub Pages** - Automatic documentation deployment

### Documentation

✅ **Markdown** - Linting and organization  
✅ **Sphinx** - Python documentation  
✅ **MkDocs** - Material theme support  
✅ **JSDoc** - JavaScript API docs  
✅ **TypeDoc** - TypeScript API docs  
✅ **Javadoc** - Java API docs  
✅ **RustDoc** - Rust API docs  
✅ **GoDoc** - Go API docs

## 📋 Workflow Details

### 1. CI/CD Pipeline (`generic-ci-cd.yml`)

**Jobs:**
1. **Detect Project** - Identifies languages and frameworks
2. **Code Quality** - Runs linters for detected languages
3. **Test** - Executes test suites with coverage
4. **Security** - Scans for vulnerabilities
5. **Build** - Creates production artifacts
6. **Report** - Generates comprehensive summary

**Runs on:**
- Every push to main, develop, or *-dev branches
- Every pull request
- Manual trigger via workflow_dispatch

**Outputs:**
- Build artifacts
- Test results
- Coverage reports
- Security scan results

### 2. Dependency Management (`generic-dependencies.yml`)

**Jobs:**
1. **Detect Dependencies** - Finds all package managers
2. **Check Outdated** - Lists outdated packages
3. **Security Audit** - Scans for vulnerabilities
4. **Auto-update** - Creates PR with updates (optional)
5. **License Compliance** - Checks package licenses

**Runs on:**
- Every Monday at 9 AM UTC
- When dependency files change
- Manual trigger

**Outputs:**
- Dependency reports
- Security audit results
- Auto-update PRs

### 3. Documentation (`generic-documentation.yml`)

**Jobs:**
1. **Detect Docs** - Finds documentation types
2. **Lint Markdown** - Checks markdown quality
3. **Collect Docs** - Organizes all documentation
4. **Build API Docs** - Generates API documentation
5. **Create Site** - Builds documentation website
6. **Deploy Pages** - Publishes to GitHub Pages

**Runs on:**
- Push to main with doc changes
- Pull requests with doc changes
- Manual trigger

**Outputs:**
- Compiled documentation
- API documentation
- GitHub Pages site

### 4. Deployment (`generic-deploy.yml`)

**Jobs:**
1. **Prepare** - Determines environment and version
2. **Build Docker** - Creates and publishes images
3. **Deploy** - Deploys to environment (customizable)
4. **Create Release** - GitHub releases for tags
5. **Notify** - Sends notifications (customizable)

**Runs on:**
- Push to main branch
- Tags starting with v*
- Manual trigger with environment selection

**Outputs:**
- Docker images in GitHub Container Registry
- Deployment manifests
- GitHub releases

## ⚙️ Customization Guide

### Change Language Versions

Edit the `env` section in each workflow:

```yaml
env:
  NODE_VERSION: '20'        # Change to your version
  PYTHON_VERSION: '3.11'    # Change to your version
  GO_VERSION: '1.21'        # Change to your version
```

### Add Deployment Steps

Edit `generic-deploy.yml` in the `deploy` job:

```yaml
- name: Deploy application
  run: |
    # Your deployment commands here
    kubectl apply -f k8s/
    # or docker-compose up -d
    # or aws ecs update-service...
```

### Add Notifications

Uncomment and configure in `generic-deploy.yml`:

```yaml
- name: Send Slack notification
  uses: slackapi/slack-github-action@v1
  with:
    webhook-url: ${{ secrets.SLACK_WEBHOOK_URL }}
```

### Enable Features

Toggle features via environment variables:

```yaml
env:
  ENABLE_SECURITY_SCAN: true    # Enable/disable security scanning
  ENABLE_CODE_COVERAGE: true    # Enable/disable coverage reports
  ENABLE_DEPENDENCY_CHECK: true # Enable/disable dependency checks
```

## 🔐 Required Secrets (Optional)

Add these in **Settings** → **Secrets and variables** → **Actions**:

| Secret | Purpose | Required? |
|--------|---------|-----------|
| `CODECOV_TOKEN` | Code coverage reporting | Optional |
| `SLACK_WEBHOOK_URL` | Slack notifications | Optional |
| `DISCORD_WEBHOOK` | Discord notifications | Optional |
| `GITHUB_TOKEN` | Auto-provided by GitHub | Automatic |

## 📊 What You Get

### On Every Push

✅ Automatic code quality checks  
✅ Test execution with coverage  
✅ Security vulnerability scanning  
✅ Build artifact generation  
✅ Detailed job summaries

### On Pull Requests

✅ All the above checks  
✅ PR status comments  
✅ Merge blocking for failures  
✅ Artifact downloads

### Weekly (Schedule)

✅ Dependency update checks  
✅ Security audits  
✅ Optional auto-update PRs

### On Releases

✅ Docker image publishing  
✅ Deployment automation  
✅ Release notes generation  
✅ Changelog creation

## 🎯 Use Cases

### Scenario 1: New Project
Copy workflows → Push → Done! Everything works automatically.

### Scenario 2: Existing Project
Copy workflows alongside existing ones. They won't conflict.

### Scenario 3: Team Repository
One setup works for all team members and all branches.

### Scenario 4: Monorepo
Detects and handles multiple languages/frameworks automatically.

### Scenario 5: Open Source
Professional CI/CD out of the box. Contributors see quality checks.

## 🐛 Troubleshooting

### Workflows not appearing?
- Check files are in `.github/workflows/`
- Verify YAML syntax is valid
- Check Actions are enabled in Settings

### Tests failing?
- Review the test job logs
- Ensure test commands are in package.json or pytest is installed
- Check test files exist

### Deploy not working?
- Add your deployment commands in deploy.yml
- Verify secrets are configured
- Check environment settings

### Documentation not deploying?
- Enable GitHub Pages in Settings → Pages
- Set source to "GitHub Actions"
- Ensure markdown files exist

## 📈 Metrics & Insights

After running these workflows, you'll have:

- **Code Quality Score** - Linting results across all languages
- **Test Coverage** - Automated coverage reporting
- **Security Score** - Vulnerability counts and severity
- **Dependency Health** - Outdated packages and security issues
- **Documentation Coverage** - Documentation completeness
- **Build Success Rate** - CI/CD reliability metrics

All visible in the Actions tab!

## 🔄 Version History

**v1.0.0** (Current)
- Initial release
- Support for 6+ languages
- 4 comprehensive workflows
- Auto-detection system
- Full documentation

## 🤝 Contributing

These workflows are designed to be generic and widely applicable.

To contribute:
1. Test changes across multiple project types
2. Ensure backward compatibility
3. Keep auto-detection reliable
4. Document any new features

## 📝 License

MIT License - Use freely in any project, commercial or open source.

## 🙏 Credits

Inspired by community best practices and real-world CI/CD needs.

## 📞 Support

- Check the README.md for detailed documentation
- Review workflow logs in the Actions tab
- Most issues are self-explanatory in job summaries

## 🎉 Ready to Use!

You now have professional, production-ready CI/CD workflows that:

✅ Work with any project type  
✅ Require zero configuration  
✅ Provide comprehensive checks  
✅ Generate detailed reports  
✅ Deploy automatically  
✅ Scale with your project

Just copy, commit, and push. Everything else is automatic!

---

**Happy coding! 🚀**

For questions or issues, refer to the individual documentation files included in this package.
