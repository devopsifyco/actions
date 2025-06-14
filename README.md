# DevOpsify Actions: Universal CLI for Dependency, Version, CVE, and System Checks

## Overview
A fast, cross-platform command-line utility for developers, DevOps engineers, and IT professionals to quickly analyze dependencies, check software versions (with CVE info), validate SSL certificates, inspect OS details, test network speed, and count lines of code. Supports Windows, Linux, and macOS, and outputs results in JSON or YAML for easy integration into CI/CD, security audits, and troubleshooting workflows.

## ✨ Features
- 📦 Analyze project dependencies for multiple package managers (Maven, npm, pip, Go, .NET, etc.)
- 🔍 Check and compare software versions locally and remotely, with version history and **CVE vulnerability info**
- 🔒 Validate SSL certificates for domains
- 🖥️ Display detailed operating system and environment information
- 🚀 Perform network speed tests
- 📊 Count lines of code in a directory or file (LOC)
- 📝 Output results in JSON and YAML formats for automation and reporting
- 📜 Version history tracking
- 🗂️ Support for multiple dependency file formats

## 🚀 Usage

### Check Action

The `check` action allows you to quickly analyze dependencies, check software versions (with CVE info), validate SSL certificates, inspect OS details, test network speed, and count lines of code. It supports multiple platforms and outputs results in JSON or YAML for easy integration into CI/CD pipelines.

#### Using `uses` (recommended)

Add the following step to your GitHub Actions workflow to use the DevOpsify Check action:

```yaml
- name: Run DevOpsify Check
  uses: devopsifyco/actions/check@master
  with:
    # Arguments to pass to check-cli (required)
    # For example: 'version istio --cve'
    args: 'version nginx --cve'

    # Version of check-cli to download (e.g., 1.2.3). If not set, downloads latest.
    # version: ''

    # DevOpsify Check token for authenticated API requests (optional)
    # token: ${{ secrets.DEVOPSIFY_TOKEN }}
```

#### Using `run` (manual CLI invocation)

If you want to run the check directly (for example, after downloading it in a previous step), you can use the `run` keyword:

```yaml
- name: Run DevOpsify Check CLI
  run: |
    ./checkctl version nginx --cve
  env:
    DEVOPSIFY_TOKEN: ${{ secrets.DEVOPSIFY_TOKEN }} # Optional, if you need authentication
```

For more details, see the [official documentation](https://devopsifyco.github.io/check-cli).


## 🤝 Contributing
See CONTRIBUTING.md for details on how to contribute to this project.

## 🎫 License
This project is licensed under the Apache License, Version 2.0. See the LICENSE file or visit <https://devopsify.co/license> for details.

## Support
For support, please open an issue in the GitHub repository or contact the maintainers.

