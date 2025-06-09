<div align="center">

# 🧹 Cache Cleaner

*A powerful and efficient cache cleaning utility for Windows systems*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Windows-blue.svg)](https://www.microsoft.com/windows)
[![Language](https://img.shields.io/badge/language-Batch-green.svg)](https://en.wikipedia.org/wiki/Batch_file)
[![GitHub release](https://img.shields.io/github/release/iramdolah/Cache-cleaner.svg)](https://github.com/iramdolah/Cache-cleaner/releases)
[![GitHub stars](https://img.shields.io/github/stars/iramdolah/Cache-cleaner.svg?style=social)](https://github.com/iramdolah/Cache-cleaner/stargazers)

![Cache Cleaner Demo](https://via.placeholder.com/800x400/2E86AB/FFFFFF?text=Cache+Cleaner+Screenshot)

</div>

---

## 📋 Table of Contents

- [✨ Features](#-features)
- [🚀 Quick Start](#-quick-start)
- [📥 Installation](#-installation)
- [💻 Usage](#-usage)
- [🔧 Advanced Options](#-advanced-options)
- [📊 Performance](#-performance)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [🙏 Acknowledgments](#-acknowledgments)

---

## ✨ Features

<div align="center">

| Feature | Description |
|---------|-------------|
| 🗑️ **Comprehensive Cleaning** | Removes temporary files, browser cache, system cache |
| ⚡ **Lightning Fast** | Optimized algorithms for quick cleaning operations |
| 🛡️ **Safe & Secure** | Only removes safe-to-delete files and folders |
| 🎯 **Targeted Cleaning** | Supports multiple browsers and applications |
| 📊 **Progress Tracking** | Real-time progress updates during cleaning |
| 🔄 **Automatic Backup** | Optional backup before cleaning critical files |

</div>

### 🎯 What Gets Cleaned

- **Windows Temp Files** (`%temp%`, `%tmp%`)
- **Browser Cache** (Chrome, Firefox, Edge, Opera)
- **System Cache** (DNS, Font cache, Icon cache)
- **Application Temp Files**
- **Recycle Bin** (optional)
- **Log Files** (system and application logs)

---

## 🚀 Quick Start

```batch
# Clone the repository
git clone https://github.com/iramdolah/Cache-cleaner.git

# Navigate to directory
cd Cache-cleaner

# Run as Administrator
Right-click on cache_cleaner.bat → "Run as administrator"
```

> **⚠️ Important:** Always run as Administrator for optimal cleaning results!

---

## 📥 Installation

### Method 1: Download Release
1. Go to [Releases](https://github.com/iramdolah/Cache-cleaner/releases)
2. Download the latest version
3. Extract to your preferred location
4. Run `cache_cleaner.bat` as Administrator

### Method 2: Clone Repository
```bash
git clone https://github.com/iramdolah/Cache-cleaner.git
cd Cache-cleaner
```

### Method 3: Direct Download
```powershell
# Using PowerShell
Invoke-WebRequest -Uri "https://github.com/iramdolah/Cache-cleaner/archive/main.zip" -OutFile "cache-cleaner.zip"
Expand-Archive -Path "cache-cleaner.zip" -DestinationPath "."
```

---

## 💻 Usage

### Basic Usage
```batch
# Standard cleaning
cache_cleaner.bat

# Silent mode (no prompts)
cache_cleaner.bat /silent

# Verbose output
cache_cleaner.bat /verbose
```

### Interactive Mode
1. **Launch the script** as Administrator
2. **Select cleaning options** from the menu
3. **Confirm** your selections
4. **Monitor progress** in real-time
5. **Review results** and freed space

### Command Line Options

| Option | Description | Example |
|--------|-------------|---------|
| `/silent` | Run without user interaction | `cache_cleaner.bat /silent` |
| `/verbose` | Show detailed output | `cache_cleaner.bat /verbose` |
| `/backup` | Create backup before cleaning | `cache_cleaner.bat /backup` |
| `/browsers` | Clean only browser cache | `cache_cleaner.bat /browsers` |
| `/system` | Clean only system cache | `cache_cleaner.bat /system` |

---

## 🔧 Advanced Options

### Custom Configuration
Create a `config.ini` file to customize cleaning behavior:

```ini
[Settings]
EnableBackup=true
SkipRecycleBin=false
VerboseOutput=true
AutoRestart=false

[Paths]
CustomTempPath=C:\MyTemp
ExcludeFolders=ImportantData,KeepThis

[Browsers]
Chrome=true
Firefox=true
Edge=true
Opera=false
```

### Scheduling Automatic Cleaning
```batch
# Schedule daily cleaning at 2 AM
schtasks /create /tn "Cache Cleaner" /tr "C:\path\to\cache_cleaner.bat /silent" /sc daily /st 02:00
```

---

## 📊 Performance

<div align="center">

### Typical Results

| System Type | Files Cleaned | Space Freed | Time Taken |
|-------------|---------------|-------------|------------|
| 💻 **Light Usage** | 1,000-5,000 | 500MB-2GB | 30-60s |
| 🖥️ **Regular Usage** | 5,000-15,000 | 2GB-8GB | 1-3 min |
| 🏢 **Heavy Usage** | 15,000+ | 8GB+ | 3-10 min |

</div>

### Before & After Comparison
```
📈 Cleaning Results:
┌─────────────────────┬──────────┬──────────┐
│ Category            │ Before   │ After    │
├─────────────────────┼──────────┼──────────┤
│ Temp Files          │ 2.3 GB   │ 0 MB     │
│ Browser Cache       │ 1.8 GB   │ 0 MB     │
│ System Cache        │ 892 MB   │ 0 MB     │
│ Log Files           │ 234 MB   │ 0 MB     │
└─────────────────────┴──────────┴──────────┘

💾 Total Space Freed: 5.2 GB
⏱️ Time Taken: 2 minutes 34 seconds
```

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### 🐛 Bug Reports
- Use the [issue tracker](https://github.com/iramdolah/Cache-cleaner/issues)
- Include system information and error messages
- Provide steps to reproduce the issue

### 💡 Feature Requests
- Check existing issues first
- Clearly describe the feature and its benefits
- Include use cases and examples

### 🔧 Pull Requests
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### 📝 Development Setup
```batch
# Clone your fork
git clone https://github.com/YOUR_USERNAME/Cache-cleaner.git

# Create development branch
git checkout -b dev-branch

# Make your changes and test thoroughly
# Test on different Windows versions if possible
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 iramdolah

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
```

---

## 🙏 Acknowledgments

- 💖 **Contributors** - Thank you to all who have contributed to this project
- 🛠️ **Tools Used** - Windows Batch scripting, Git, GitHub
- 📚 **Inspiration** - Various system optimization tools and community feedback
- 🌟 **Special Thanks** - To the open-source community for continuous support

---

<div align="center">

### 📞 Support & Contact

[![GitHub Issues](https://img.shields.io/badge/GitHub-Issues-red?style=for-the-badge&logo=github)](https://github.com/iramdolah/Cache-cleaner/issues)
[![Email](https://img.shields.io/badge/Email-Contact-blue?style=for-the-badge&logo=gmail)](mailto:your.email@example.com)

---

**⭐ Star this repository if you find it helpful!**

*Made with ❤️ by [iramdolah](https://github.com/iramdolah)*

---

### 📊 Repository Stats

![GitHub repo size](https://img.shields.io/github/repo-size/iramdolah/Cache-cleaner)
![GitHub last commit](https://img.shields.io/github/last-commit/iramdolah/Cache-cleaner)
![GitHub issues](https://img.shields.io/github/issues/iramdolah/Cache-cleaner)
![GitHub pull requests](https://img.shields.io/github/issues-pr/iramdolah/Cache-cleaner)

</div>
