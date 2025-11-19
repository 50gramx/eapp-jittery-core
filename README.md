# EAPP Jittery Core 🎯

[![System Contracts Build](https://img.shields.io/github/actions/workflow/status/50gramx/eapp-jittery-core/dart-package-release.yml?label=CI/CD)](https://github.com/50gramx/eapp-jittery-core/actions/workflows/dart-package-release.yml)
[![Latest Release](https://img.shields.io/github/v/release/50gramx/eapp-jittery-core?label=latest%20release)](https://github.com/50gramx/eapp-jittery-core/releases/latest)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Package Index](https://img.shields.io/badge/index-private%20package%20index-blue)](https://raw.githubusercontent.com/50gramx/eapp-jittery-core/master/packages/index.html)

> **Framework-agnostic UI component library for Eutopia** - Core jittery functionality providing reusable UI components and patterns for Eutopia applications.

## 📦 Package Index & Downloads

### 🚀 Quick Access
- **[📋 Package Index (HTML Preview)](https://html-preview.github.io/?url=https://github.com/50gramx/eapp-jittery-core/blob/master/packages/index.html)** - View all available packages
- **[📋 Raw Package Index](https://raw.githubusercontent.com/50gramx/eapp-jittery-core/master/packages/index.html)** - Direct package index
- **[📥 Latest Release](https://github.com/50gramx/eapp-jittery-core/releases/latest)** - Download latest version
- **[🏗️ Build Status](https://github.com/50gramx/eapp-jittery-core/actions/workflows/dart-package-release.yml)** - Check CI/CD status

### 📦 Available Packages
> **📋 View all available packages and versions in our [Package Index (HTML Preview)](https://html-preview.github.io/?url=https://github.com/50gramx/eapp-jittery-core/blob/master/packages/index.html)**

### 🔧 Installation
```yaml
# Add to pubspec.yaml
dependencies:
  eapp_jittery_core:
    git:
      url: https://github.com/50gramx/eapp-jittery-core.git
      ref: master  # or specific version tag
```

## 📋 Table of Contents

- [Overview](#-overview)
- [🚀 Quick Start](#-quick-start)
- [📦 Installation](#-installation)
- [🔧 Usage](#-usage)
- [📚 API Reference](#-api-reference)
- [🏗️ Architecture](#-architecture)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

## 🌟 Overview

EAPP Jittery Core provides **framework-agnostic UI components** for the Eutopia application ecosystem. This library contains the core jittery functionality that can be used across different platforms and frameworks.

### 🎯 Key Features

- **🎨 Framework-Agnostic** - Works with Flutter, web, and other platforms
- **📦 Reusable Components** - Modular UI components for consistent design
- **⚡ High Performance** - Optimized for smooth animations and interactions
- **🔧 Customizable** - Flexible theming and configuration options
- **📱 Responsive** - Adapts to different screen sizes and orientations
- **♿ Accessible** - Built with accessibility best practices

### 🏗️ Component Categories

| Category | Description | Status |
|----------|-------------|--------|
| **🎨 Layout** | Container, Grid, Flex layouts | ✅ |
| **🔘 Interactive** | Buttons, Inputs, Forms | ✅ |
| **📊 Data** | Tables, Lists, Cards | ✅ |
| **🎭 Animation** | Transitions, Effects | ✅ |
| **🌐 Navigation** | Menus, Breadcrumbs | ✅ |

## 🚀 Quick Start

### 1. Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  eapp_jittery_core: ^1.0.0
  flutter:
    sdk: flutter
```

Then run:
```bash
dart pub get
```

### 2. Basic Usage

```dart
import 'package:eapp_jittery_core/eapp_jittery_core.dart';

void main() {
  // Initialize jittery core
  JitteryCore.initialize();
  
  // Use core components
  final component = JitteryComponent();
  component.render();
}
```

### 3. Component Integration

```dart
import 'package:eapp_jittery_core/src/components/layout.dart';
import 'package:eapp_jittery_core/src/components/interactive.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return JitteryContainer(
      child: JitteryButton(
        onPressed: () => print('Jittery button pressed!'),
        child: Text('Click Me'),
      ),
    );
  }
}
```

## 📦 Installation

### Requirements

- **Dart**: 3.0.0+
- **Flutter**: 3.0.0+ (for Flutter apps)
- **Dependencies**: 
  - `flutter: ^3.0.0`
  - `yaml: ^3.1.2`

### Installation Methods

#### 1. Git Repository (Recommended)
```yaml
# pubspec.yaml
dependencies:
  eapp_jittery_core:
    git:
      url: https://github.com/50gramx/eapp-jittery-core.git
      ref: master
```

#### 2. From GitHub Releases
```yaml
# pubspec.yaml
dependencies:
  eapp_jittery_core:
    git:
      url: https://github.com/50gramx/eapp-jittery-core.git
      ref: v1.0.0
```

#### 3. Local Development
```bash
git clone https://github.com/50gramx/eapp-jittery-core.git
cd eapp-jittery-core
dart pub get
```

## 🔧 Usage

### Importing Components

```dart
// Core library
import 'package:eapp_jittery_core/eapp_jittery_core.dart';

// Specific component categories
import 'package:eapp_jittery_core/src/components/layout.dart';
import 'package:eapp_jittery_core/src/components/interactive.dart';
import 'package:eapp_jittery_core/src/components/data.dart';
import 'package:eapp_jittery_core/src/components/animation.dart';
```

### Working with Components

```dart
import 'package:eapp_jittery_core/src/components/layout.dart';

// Create responsive layouts
final layout = JitteryLayout(
  type: LayoutType.responsive,
  children: [
    JitteryContainer(
      width: 300,
      height: 200,
      child: Text('Responsive Container'),
    ),
  ],
);

// Apply themes
final themedComponent = JitteryComponent()
  ..applyTheme(JitteryTheme.light)
  ..setAnimation(JitteryAnimation.fade);
```

### Configuration

```dart
import 'package:eapp_jittery_core/eapp_jittery_core.dart';

// Initialize with custom configuration
JitteryCore.initialize(
  config: JitteryConfig(
    theme: JitteryTheme.dark,
    animationSpeed: AnimationSpeed.fast,
    responsiveBreakpoints: {
      'mobile': 768,
      'tablet': 1024,
      'desktop': 1440,
    },
  ),
);
```

## 📚 API Reference

### Core Classes

#### JitteryCore
```dart
class JitteryCore {
  static void initialize({JitteryConfig? config});
  static JitteryConfig get config;
  static void setTheme(JitteryTheme theme);
  static void setAnimationSpeed(AnimationSpeed speed);
}
```

#### JitteryComponent
```dart
class JitteryComponent {
  void render();
  void applyTheme(JitteryTheme theme);
  void setAnimation(JitteryAnimation animation);
  void setResponsive(ResponsiveConfig config);
}
```

#### JitteryConfig
```dart
class JitteryConfig {
  final JitteryTheme theme;
  final AnimationSpeed animationSpeed;
  final Map<String, int> responsiveBreakpoints;
  final bool enableAccessibility;
}
```

### Component Categories

#### Layout Components
```dart
// Available components:
// - JitteryContainer
// - JitteryGrid
// - JitteryFlex
// - JitteryStack
```

#### Interactive Components
```dart
// Available components:
// - JitteryButton
// - JitteryInput
// - JitteryForm
// - JitteryDropdown
```

#### Data Components
```dart
// Available components:
// - JitteryTable
// - JitteryList
// - JitteryCard
// - JitteryChart
```

## 🏗️ Architecture

### Component Structure

```
eapp_jittery_core/
├── lib/
│   ├── eapp_jittery_core.dart          # Main library entry point
│   └── src/
│       ├── core/                       # Core functionality
│       │   ├── jittery_core.dart
│       │   ├── config.dart
│       │   └── theme.dart
│       ├── components/                 # UI components
│       │   ├── layout/
│       │   ├── interactive/
│       │   ├── data/
│       │   └── animation/
│       └── utils/                      # Utility functions
│           ├── responsive.dart
│           └── accessibility.dart
└── test/                              # Test files
```

### Design Principles

1. **Framework-Agnostic** - Core logic independent of UI framework
2. **Composable** - Components can be combined and extended
3. **Responsive** - Adapts to different screen sizes
4. **Accessible** - Built with accessibility in mind
5. **Performant** - Optimized for smooth interactions

## 🤝 Contributing

### For Core Components

1. **Fork** the repository
2. **Create** a feature branch
3. **Make** your changes
4. **Test** thoroughly
5. **Submit** a pull request

### Development Setup

```bash
# Clone repository
git clone https://github.com/50gramx/eapp-jittery-core.git
cd eapp-jittery-core

# Install dependencies
dart pub get

# Run tests
dart test

# Run analysis
dart analyze

# Build package
dart pub build
```

### Code Style

- Follow Dart/Flutter conventions
- Use meaningful variable and function names
- Add comprehensive documentation
- Write unit tests for new features
- Ensure accessibility compliance

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🔗 Quick Links

- **📦 Package Index**: [View Packages](https://raw.githubusercontent.com/50gramx/eapp-jittery-core/master/packages/index.html)
- **🏗️ Eutopia Project**: [eapp-jittery-modelled](https://github.com/50gramx/eapp-jittery-modelled)
- **🐛 Issues**: [GitHub Issues](https://github.com/50gramx/eapp-jittery-core/issues)
- **📖 Documentation**: [API Docs](https://github.com/50gramx/eapp-jittery-core/wiki)
- **💬 Discussions**: [GitHub Discussions](https://github.com/50gramx/eapp-jittery-core/discussions)

---

<div align="center">
  <p><strong>Framework-agnostic UI component library for Eutopia</strong></p>
  <p><em>Built with ❤️ by the EAPP Team</em></p>
</div> 

## Jittery & Eutopia: Integration, Learnings, and Key Decisions (Historical Reference)

### Overview
- **Jittery** is a framework-agnostic UI component library for Eutopia, designed for multi-platform (Flutter/Dart, Python, Node.js, Kotlin, Swift) integration.
- **Eutopia** is the broader application ecosystem, with hybrid-dart as the main integration point for UI and business logic.

### Key Learnings & Decisions
- **Protobuf Distribution:**
  - Multi-language protobuf client code generation is automated via GitHub Actions.
  - Artifacts are distributed using GitHub Releases and private package indexes (hosted via raw GitHub URLs).
  - Versioning uses a `year.month.patch` format for consistency across languages.
- **Dart/Flutter Package Management:**
  - `publish_to: none` is set for private packages to avoid accidental pub.dev publishing.
  - For CI/CD, git dependencies are used, but for publishing, only published versions are allowed.
  - Integration with hybrid-dart is done via git or path dependencies during development.
- **CI/CD & Workflows:**
  - Workflows are parallelized for multi-language builds.
  - HTML templates for package indexes are offloaded to external files for maintainability.
  - GitHub token permissions are critical for private repo access and release uploads.
  - Branch protection and artifact size limits must be respected to avoid push failures.
- **Repository Structure:**
  - `eapp-jittery-core` contains the core UI logic and components.
  - `eapp-jittery-modelled` contains design language-specific implementations (e.g., Level design system).
  - `eapp-hybrid-dart` is the main app, integrating Jittery and Eutopia logic.
- **Common Issues & Fixes:**
  - 403/404 errors: Usually due to token or permissions issues.
  - Dart version mismatches: Ensure workflow Dart SDK matches `pubspec.yaml`.
  - Git dependencies: Not allowed for publishable packages; use only for development.
  - Unused imports/variables: Clean up to pass `flutter analyze`.
  - Merge conflicts: Always resolve in favor of the latest version and keep `publish_to: none` for private packages.

### Integration Steps (for new contributors)
1. **Clone all relevant repos:** `eapp-jittery-core`, `eapp-jittery-modelled`, `eapp-hybrid-dart`.
2. **Install dependencies:**
   - For Dart/Flutter: `flutter pub get` in each package.
   - For Python/Node.js: Use respective package managers.
3. **Link packages for local development:**
   - Use `path:` dependencies in `pubspec.yaml` for local testing.
   - Switch to `git:` or published versions for CI/CD.
4. **Run tests:**
   - Use `flutter test` and `flutter analyze` for Dart packages.
   - Run integration tests in `eapp-hybrid-dart` to verify end-to-end functionality.
5. **CI/CD:**
   - Push changes to feature branches; use PRs for main branch merges.
   - Ensure all workflows pass before merging.

### References
- See the main `README.md` in each repo for package-specific details.
- For troubleshooting, check workflow logs and ensure all tokens/permissions are set up correctly.
- For further integration, refer to the `integration tests` section in `eapp-hybrid-dart`.

---
This section is maintained as a living document. Please update with new learnings, decisions, or integration steps as the project evolves. 