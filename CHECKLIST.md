# Pre-Flight Checklist

Use this checklist before deploying workflows to a new repository.

## ✅ Repository Setup

### Basic Requirements
- [ ] GitHub repository created
- [ ] GitHub Actions enabled (Settings → Actions → General)
- [ ] Repository is not archived
- [ ] You have write access to the repository

### Optional but Recommended
- [ ] Branch protection rules configured for `main` and `develop`
- [ ] `.gitignore` file configured for your project type
- [ ] License file added (LICENSE.md)
- [ ] README.md exists with project description

## ✅ Workflow Installation

### Copy Workflows
- [ ] Created `.github/workflows/` directory
- [ ] Copied `ci.yml`
- [ ] Copied `branch-management.yml`
- [ ] Copied `dependencies.yml`
- [ ] Copied `documentation.yml`
- [ ] Copied `deploy.yml` (if deploying)

### Initial Commit
- [ ] Reviewed workflow files
- [ ] Committed workflows with message: `ci: add GitHub Actions workflows`
- [ ] Pushed to repository
- [ ] Verified workflows appear in Actions tab

## ✅ Project Configuration

### Node.js Projects
- [ ] `package.json` exists
- [ ] `npm install` works locally
- [ ] Scripts defined: `test`, `build`, `lint` (optional)
- [ ] `.npmrc` configured if using private registry

### Python Projects
- [ ] `requirements.txt` or `pyproject.toml` exists
- [ ] Virtual environment works locally
- [ ] Tests run with `pytest` (if applicable)
- [ ] `requirements-dev.txt` for development dependencies

### Docker Projects
- [ ] Dockerfile exists
- [ ] Docker build works locally: `docker build -t test .`
- [ ] .dockerignore file configured
- [ ] Multi-stage builds used (recommended)

## ✅ Environment Configuration

### GitHub Environments (for deployments)
- [ ] Created `production` environment
- [ ] Created `staging` environment
- [ ] Created `development` environment
- [ ] Added environment protection rules
- [ ] Configured required reviewers (for production)

### Secrets Configuration
Required secrets (if applicable):
- [ ] Database credentials
- [ ] API keys
- [ ] Cloud provider credentials
- [ ] Container registry tokens (if not using GHCR)

Optional secrets:
- [ ] `CODECOV_TOKEN` for coverage reports
- [ ] `SLACK_WEBHOOK_URL` for notifications
- [ ] `DISCORD_WEBHOOK_URL` for notifications

## ✅ GitHub Pages (for documentation)

- [ ] Enabled GitHub Pages (Settings → Pages)
- [ ] Source set to "GitHub Actions"
- [ ] Custom domain configured (optional)
- [ ] HTTPS enforced

## ✅ Repository Permissions

### GitHub Actions Permissions
- [ ] Workflow permissions set correctly (Settings → Actions → General)
- [ ] "Read and write permissions" enabled
- [ ] "Allow GitHub Actions to create and approve pull requests" enabled (for auto-updates)

### Package Permissions (for Docker)
- [ ] Package visibility set (public or private)
- [ ] Access tokens configured if needed

## ✅ Branch Strategy

### Branch Setup
- [ ] `main` branch exists (default production)
- [ ] `develop` branch created (staging/development)
- [ ] Branch naming conventions documented
- [ ] Team members know the workflow

### Branch Protection
For `main`:
- [ ] Require pull request reviews
- [ ] Require status checks to pass
- [ ] Require branches to be up to date
- [ ] Include administrators (recommended)

For `develop`:
- [ ] Require status checks to pass
- [ ] Allow force pushes from maintainers (optional)

## ✅ Deployment Configuration

### Deployment Setup
- [ ] Reviewed `deploy.yml` deployment commands
- [ ] Added actual deployment logic for your infrastructure
- [ ] Configured deployment URLs in `deploy-config.json`
- [ ] Tested deployment to staging first

### Infrastructure Access
- [ ] GitHub Actions can access deployment targets
- [ ] Network/firewall rules allow GitHub IPs
- [ ] SSH keys or API tokens configured
- [ ] Health check endpoints are accessible

## ✅ Testing & Validation

### Local Testing
- [ ] Run tests locally: `npm test` or `pytest`
- [ ] Build works locally: `npm run build` or `python setup.py build`
- [ ] Linting passes: `npm run lint` or `flake8`
- [ ] No obvious errors or warnings

### First Workflow Run
- [ ] Push a test change to trigger workflows
- [ ] Monitor workflow runs in Actions tab
- [ ] All workflows complete successfully
- [ ] Review job summaries and outputs
- [ ] Check for any warnings or errors

## ✅ Documentation

### Project Documentation
- [ ] README.md describes the project
- [ ] CONTRIBUTING.md explains contribution process
- [ ] Documentation for setting up locally
- [ ] API documentation (if applicable)

### Team Communication
- [ ] Team informed about new CI/CD setup
- [ ] Branch workflow explained to team
- [ ] Contribution guidelines shared
- [ ] Point of contact established for questions

## ✅ Monitoring & Maintenance

### Set Up Monitoring
- [ ] Watch Actions tab for failures
- [ ] Configure notification preferences
- [ ] Set up error alerting (optional)
- [ ] Review workflow runs weekly

### Scheduled Tasks
- [ ] Dependency updates running (weekly check)
- [ ] Security scans enabled
- [ ] License compliance checked
- [ ] Documentation builds successful

## 🎯 Optional Enhancements

### Advanced Features
- [ ] Code coverage tracking enabled
- [ ] Performance testing integrated
- [ ] E2E tests configured
- [ ] Smoke tests after deployment
- [ ] Rollback procedures documented

### Integration
- [ ] Slack/Discord notifications configured
- [ ] Issue tracking integration
- [ ] Project management tool integration
- [ ] Code quality tools (SonarQube, CodeClimate)

## 📋 Post-Launch Tasks

### Week 1
- [ ] Monitor all workflow runs
- [ ] Address any failures immediately
- [ ] Gather team feedback
- [ ] Document any issues or learnings

### Month 1
- [ ] Review workflow efficiency
- [ ] Optimize slow jobs
- [ ] Update documentation based on usage
- [ ] Consider additional automations

## 🚨 Troubleshooting Quick Reference

If workflows fail:
1. Check the job logs in Actions tab
2. Verify all required files exist
3. Confirm secrets are configured
4. Test locally first
5. Check workflow syntax with YAML lint
6. Review recent changes to workflow files

## ✅ Ready to Launch!

Once all items are checked:
1. Create a test branch
2. Make a small change
3. Open a PR to `develop`
4. Verify all checks pass
5. Merge and verify deployment
6. Celebrate! 🎉

---

**Need help?** Review the SETUP.md guide or workflow documentation.
