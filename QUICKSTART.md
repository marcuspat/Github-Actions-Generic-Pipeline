# ⚡ Quick Start Guide

Get up and running in 2 minutes!

## 🎯 The Simplest Way

### Option 1: Using the Setup Script (Recommended)

```bash
# Download and run the setup script
curl -sSL https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/setup.sh | bash
```

Or manually:

```bash
# Make it executable
chmod +x setup.sh

# Run it
./setup.sh
```

The script will:
- ✅ Create `.github/workflows/` directory
- ✅ Let you choose which workflows to install
- ✅ Detect your project type
- ✅ Optionally commit and push for you

### Option 2: Manual Installation (3 commands)

```bash
# 1. Create workflows directory
mkdir -p .github/workflows

# 2. Copy workflow files
cp generic-*.yml .github/workflows/

# 3. Commit and push
git add .github/workflows/ && \
git commit -m "ci: add workflows" && \
git push
```

## 🎬 What Happens Next?

1. **First Push**: Workflows start running automatically
2. **Auto-Detection**: They detect your project type (Node.js, Python, etc.)
3. **Checks Run**: Linting, testing, security scanning
4. **Reports Generated**: Check the Actions tab for results

## 🔍 Verify It's Working

Go to your GitHub repository and:

1. Click the **Actions** tab
2. You should see workflows running
3. Click on any workflow to see details

## ⚙️ Zero Configuration Required

The workflows work out of the box with:

- ✅ Node.js projects (npm, yarn, pnpm)
- ✅ Python projects (pip, poetry, pipenv)
- ✅ Go projects
- ✅ Java projects (Maven, Gradle)
- ✅ Ruby projects (Bundler)
- ✅ Rust projects (Cargo)
- ✅ Multi-language projects
- ✅ Monorepos

## 🎛️ Optional: Customize Later

Want to customize? Edit the workflow files:

```yaml
# Change language versions
env:
  NODE_VERSION: '20'      # Your version
  PYTHON_VERSION: '3.11'  # Your version
```

## 🚀 Next Steps

1. **Watch it run**: Check the Actions tab
2. **Review results**: Look at the job summaries
3. **Download artifacts**: Build outputs are saved
4. **Deploy**: Push to main to deploy (customize deploy.yml first)

## 📚 Need More Details?

See the full [README.md](README.md) for:
- Complete feature list
- Customization options
- Troubleshooting
- Best practices

## ❓ Common Questions

**Q: Will this break my existing workflows?**  
A: No, these workflows are completely independent.

**Q: Do I need to configure anything?**  
A: Nope! They auto-detect everything.

**Q: Can I use only some workflows?**  
A: Yes! Use the setup script or copy only the files you need.

**Q: What if I use a different language?**  
A: The workflows will gracefully skip unsupported languages.

**Q: How do I disable a workflow?**  
A: Delete the file or add `if: false` to the workflow.

## 🎉 You're Done!

That's literally it. Your repository now has:
- ✅ Automated testing
- ✅ Code quality checks  
- ✅ Security scanning
- ✅ Dependency management
- ✅ Documentation generation
- ✅ Deployment automation

All running automatically on every push!

---

**Need help?** Check the [full README](README.md) or open an issue.
