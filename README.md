# Modern Toast 🎉

A beautiful, modern, and highly customizable toast notification package for Flutter with smooth animations and multiple toast types.

[![pub package](https://img.shields.io/pub/v/modern_toast.svg)](https://pub.dev/packages/modern_toast)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## ✨ Features

- 🎨 **4 Pre-defined Toast Types**: Success, Error, Warning, and Info
- 🎭 **Smooth Animations**: Beautiful zoom-in and slide-down animations
- 🎯 **Customizable**: Create your own custom toasts with custom colors and icons
- 📱 **Responsive**: Automatically adjusts to different screen sizes
- ⚡ **Easy to Use**: Simple API with minimal setup
- 🚫 **Smart Debouncing**: Prevents multiple toasts from showing at once
- 🎪 **Auto-dismiss**: Toasts automatically dismiss after a set duration

## 📸 Screenshots

_Coming soon_

## 🚀 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  modern_toast: ^0.0.1
```

Then run:

```bash
flutter pub get
```

### Basic Usage

Import the package:

```dart
import 'package:modern_toast/modern_toast.dart';
```

#### Success Toast

```dart
showModernToast(
  context,
  message: 'Operation completed successfully!',
  type: ModernToastType.success,
);
```

#### Error Toast

```dart
showModernToast(
  context,
  message: 'Something went wrong!',
  type: ModernToastType.error,
);
```

#### Warning Toast

```dart
showModernToast(
  context,
  message: 'Please check your input!',
  type: ModernToastType.warning,
);
```

#### Info Toast

```dart
showModernToast(
  context,
  message: 'This is an informational message.',
  type: ModernToastType.info,
);
```

### Custom Duration

You can specify a custom duration for how long the toast should be visible:

```dart
showModernToast(
  context,
  message: 'This toast will show for 5 seconds',
  type: ModernToastType.success,
  durationInMilliseconds: 5000, // 5 seconds
);
```

### Custom Text Style

You can customize the text style of your toast messages:

```dart
showModernToast(
  context,
  message: 'Custom styled message!',
  type: ModernToastType.success,
  textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontStyle: FontStyle.italic,
  ),
);
```

### Hide Icon

You can hide the icon from the toast:

```dart
showModernToast(
  context,
  message: 'Toast without icon',
  type: ModernToastType.info,
  showIcon: false,
);
```

### Custom Toast with Custom Text Style and No Icon

```dart
showCustomToast(
  context,
  message: 'Fully customized toast',
  color: Colors.purple,
  showIcon: false,
  textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
);
```

## 🎨 Toast Types

| Type | Color | Icon | Use Case |
|------|-------|------|----------|
| `ModernToastType.success` | Green (#4CAF50) | ✓ Check Circle | Success messages |
| `ModernToastType.error` | Red (#F44336) | ⚠ Error | Error messages |
| `ModernToastType.warning` | Orange (#FF9800) | ⚠ Warning | Warning messages |
| `ModernToastType.info` | Blue (#2196F3) | ℹ Info | Informational messages |

## 🎯 API Reference

### `showModernToast`

Shows a toast notification with predefined styling.

**Parameters:**
- `context` (required): BuildContext
- `message` (required): String - The message to display
- `type` (required): ModernToastType - The type of toast
- `durationInMilliseconds`: int? - Duration in milliseconds (default: 3000)
- `textStyle`: TextStyle? - Custom text style for the message
- `showIcon`: bool - Whether to show the icon (default: true)
- `actionLabel`: String? - Label for action button (not yet implemented)
- `onActionPressed`: VoidCallback? - Callback for action button (not yet implemented)

### `showCustomToast`

Shows a custom toast notification with custom styling.

**Parameters:**
- `context` (required): BuildContext
- `message`: String? - The message to display (default: 'There was an error, please try again later!')
- `color`: Color? - Background color (default: blue)
- `icon`: IconData? - Icon to display (default: Icons.error_outline)
- `durationInMilliseconds`: int? - Duration in milliseconds (default: 3000)
- `textStyle`: TextStyle? - Custom text style for the message
- `showIcon`: bool - Whether to show the icon (default: true)

## 📦 Dependencies

This package depends on:
- [animate_do](https://pub.dev/packages/animate_do) - For smooth animations

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 💡 Credits

Created with ❤️ by the Flutter community

## 📧 Contact

If you have any questions or suggestions, please feel free to open an issue on GitHub.

---

**Note:** No additional setup required! The package works out of the box with standard Flutter widgets.
