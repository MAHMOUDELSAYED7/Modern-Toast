# Modern Toast

A beautiful, modern, and highly customizable toast notification package for Flutter with smooth animations, multiple toast types, and advanced customization options.

https://github.com/user-attachments/assets/7de0525a-c655-4fcd-8745-21d941465fb1


## ✨ Features

- 🎨 **4 Pre-defined Toast Types**: Success, Error, Warning, and Info with beautiful colors
- 🎭 **Smooth Animations**: Zoom-in and slide-down animations using animate_do
- 🎯 **Customizable**: Create your own custom toasts with custom colors, icons, and text styles
- 📱 **Responsive Design**: Automatically adjusts to different screen sizes and text scaling
- ⚡ **Smart Debouncing**: Prevents multiple toasts from showing simultaneously
- 🎪 **Auto-dismiss**: Configurable duration with smooth fade-out animations
- 🎨 **Text Customization**: Custom fonts, colors, weights, and styles
- 👁️ **Icon Control**: Show or hide icons with ease
- 🛡️ **Production-ready**: Comprehensive error handling prevents crashes
- 🧪 **Well-tested**: Extensive test coverage for all functionality
- 🔄 **Platform-adaptive**: Works seamlessly across iOS, Android, Web, and Desktop

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  modern_toast: ^0.0.2
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

Import the package:

```dart
import 'package:modern_toast/modern_toast.dart';
```

### Basic Usage

```dart
// Display predefined toast types
showModernToast(
  context,
  message: 'Operation completed successfully!',
  type: ModernToastType.success,
);

// Display custom toast
showCustomToast(
  context,
  message: 'Custom styled toast!',
  color: Colors.purple,
  icon: Icons.star,
);
```

### 📐 Custom Sizing & Styling

```dart
// Custom text styling
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
)

// Hide icon
showModernToast(
  context,
  message: 'Toast without icon',
  type: ModernToastType.info,
  showIcon: false,
)
```

### 🎨 Custom Toast Examples

```dart
// Fully customized toast
showCustomToast(
  context,
  message: 'Beautiful custom toast',
  color: Colors.purple,
  icon: Icons.star,
  durationInMilliseconds: 4000,
  textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
)

// Custom toast without icon
showCustomToast(
  context,
  message: 'No icon toast',
  color: Colors.orange,
  showIcon: false,
  textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
)
```

### 📏 Duration Control

```dart
// Long duration toast
showModernToast(
  context,
  message: 'This toast stays for 5 seconds!',
  type: ModernToastType.success,
  durationInMilliseconds: 5000,
)
```

### 📝 Long Message Handling

```dart
// Automatically handles long messages
showModernToast(
  context,
  message: 'This is a very long message that demonstrates how the toast handles multiple lines of text. The container will automatically adjust its width and the text will wrap properly with ellipsis overflow.',
  type: ModernToastType.info,
  durationInMilliseconds: 5000,
)
```

## 📚 Complete Example

Here's a comprehensive example showcasing all major features:

```dart
import 'package:flutter/material.dart';
import 'package:modern_toast/modern_toast.dart';

class ToastDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modern Toast Demo')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Predefined toast types
            ElevatedButton(
              onPressed: () => showModernToast(
                context,
                message: 'Success! Operation completed.',
                type: ModernToastType.success,
              ),
              child: Text('Show Success Toast'),
            ),

            SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => showModernToast(
                context,
                message: 'Error! Something went wrong.',
                type: ModernToastType.error,
              ),
              child: Text('Show Error Toast'),
            ),

            SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => showModernToast(
                context,
                message: 'Warning! Check your input.',
                type: ModernToastType.warning,
              ),
              child: Text('Show Warning Toast'),
            ),

            SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => showModernToast(
                context,
                message: 'Info: This is a message.',
                type: ModernToastType.info,
              ),
              child: Text('Show Info Toast'),
            ),

            SizedBox(height: 20),
            Divider(),

            // Custom toasts
            ElevatedButton(
              onPressed: () => showCustomToast(
                context,
                message: 'Custom purple toast! ⭐',
                color: Colors.purple,
                icon: Icons.star,
                durationInMilliseconds: 4000,
              ),
              child: Text('Custom Toast'),
            ),

            SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => showModernToast(
                context,
                message: 'Bold custom text style!',
                type: ModernToastType.success,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              child: Text('Custom Text Style'),
            ),

            SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => showModernToast(
                context,
                message: 'No icon toast',
                type: ModernToastType.info,
                showIcon: false,
              ),
              child: Text('No Icon Toast'),
            ),

            SizedBox(height: 12),

            ElevatedButton(
              onPressed: () => showModernToast(
                context,
                message: 'Long duration toast (5s)',
                type: ModernToastType.success,
                durationInMilliseconds: 5000,
              ),
              child: Text('Long Duration'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🎮 Interactive Example App

The package includes a comprehensive example app that demonstrates all features:

- **4 Predefined Toast Types**: Success, Error, Warning, and Info
- **Custom Toast Examples**: Purple and pink themed toasts
- **Text Customization**: Bold, italic, and custom font sizes
- **Icon Control**: Show/hide icon functionality
- **Duration Control**: Short and long duration examples
- **Long Message Handling**: Multi-line text with proper wrapping

To run the example app:

```bash
cd example
flutter run
```

The example app showcases all supported platforms:
- **Mobile (iOS/Android)**: Native platform experience
- **Desktop (macOS/Windows/Linux)**: Native desktop experience
- **Web**: Browser-based experience

## 📖 API Reference

### showModernToast

Displays a toast notification with predefined styling.

```dart
void showModernToast(
  BuildContext context, {
  required String message,
  required ModernToastType type,
  int? durationInMilliseconds,
  TextStyle? textStyle,
  bool showIcon = true,
  String? actionLabel,
  VoidCallback? onActionPressed,
})
```

**Parameters:**
- `context` *(required)*: BuildContext - The current widget context
- `message` *(required)*: String - The message to display
- `type` *(required)*: ModernToastType - The toast type (success, error, warning, info)
- `durationInMilliseconds`: int? - Display duration in milliseconds (default: 3000)
- `textStyle`: TextStyle? - Custom text styling
- `showIcon`: bool - Whether to show the icon (default: true)
- `actionLabel`: String? - Action button label (not yet implemented)
- `onActionPressed`: VoidCallback? - Action button callback (not yet implemented)

### showCustomToast

Displays a fully customizable toast notification.

```dart
void showCustomToast(
  BuildContext context, {
  String? message,
  Color? color,
  IconData? icon,
  int? durationInMilliseconds,
  TextStyle? textStyle,
  bool showIcon = true,
})
```

**Parameters:**
- `context` *(required)*: BuildContext - The current widget context
- `message`: String? - The message to display (default: 'There was an error, please try again later!')
- `color`: Color? - Background color (default: ModernToastColors.info)
- `icon`: IconData? - Icon to display (default: Icons.error_outline)
- `durationInMilliseconds`: int? - Display duration in milliseconds (default: 3000)
- `textStyle`: TextStyle? - Custom text styling
- `showIcon`: bool - Whether to show the icon (default: true)

### ModernToastType Enum

```dart
enum ModernToastType { success, error, warning, info }
```

### ModernToastColors Class

```dart
class ModernToastColors {
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
  static const Color white = Color(0xFFFFFFFF);
}
```

## 🎯 Toast Types & Colors

| Type | Color | Icon | Use Case |
|------|-------|------|----------|
| `ModernToastType.success` | Green (#4CAF50) | ✅ Check Circle | Success messages |
| `ModernToastType.error` | Red (#F44336) | ❌ Error | Error messages |
| `ModernToastType.warning` | Orange (#FF9800) | ⚠️ Warning | Warning messages |
| `ModernToastType.info` | Blue (#2196F3) | ℹ️ Info | Informational messages |

## 🔧 Platform Support

| Platform | Status | Notes |
|----------|--------|-------|
| **iOS** | ✅ Full Support | Native iOS experience |
| **Android** | ✅ Full Support | Material Design experience |
| **Web** | ✅ Full Support | Browser-compatible |
| **macOS** | ✅ Full Support | Native macOS experience |
| **Windows** | ✅ Full Support | Native Windows experience |
| **Linux** | ✅ Full Support | Native Linux experience |

## 🔗 Dependencies

This package uses these well-maintained dependencies:

- **[animate_do](https://pub.dev/packages/animate_do)** `^3.3.4` - Smooth animations and transitions

## 🧪 Testing

The package includes comprehensive tests covering:

- ✅ **Toast display functionality** for all types
- ✅ **Custom styling options** (colors, text styles, icons)
- ✅ **Animation behavior** and timing
- ✅ **Platform compatibility** across all supported platforms
- ✅ **Error handling** and edge cases
- ✅ **Debouncing mechanism** to prevent multiple toasts
- ✅ **Duration control** and auto-dismiss functionality

Run tests with:
```bash
flutter test
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

For major changes, please open an issue first to discuss what you would like to change.

## 📄 License

MIT License - see the [LICENSE](LICENSE) file for details.