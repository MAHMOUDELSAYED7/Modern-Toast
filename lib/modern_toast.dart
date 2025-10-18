/// A beautiful, modern, and customizable toast notification package for Flutter
/// with smooth animations and multiple toast types.
///
/// This package provides an easy-to-use API for displaying toast notifications
/// with predefined styles (success, error, warning, info) or fully customizable
/// toasts with custom colors, icons, and text styles.
///
/// ## Features
/// - 4 predefined toast types with beautiful colors and icons
/// - Smooth zoom-in and slide-down animations
/// - Fully customizable colors, icons, and text styles
/// - Responsive design that adapts to different screen sizes
/// - Smart debouncing to prevent multiple toasts
/// - Configurable duration and auto-dismiss
/// - Platform-adaptive across iOS, Android, Web, and Desktop
///
/// ## Basic Usage
/// ```dart
/// import 'package:modern_toast/modern_toast.dart';
///
/// // Show a success toast
/// showModernToast(
///   context,
///   message: 'Operation completed successfully!',
///   type: ModernToastType.success,
/// );
///
/// // Show a custom toast
/// showModernToast(
///   context,
///   message: 'Custom styled toast!',
///   color: Colors.purple,
///   icon: Icons.star,
/// );
/// ```
library modern_toast;

export 'src/modern_toast_types.dart';
export 'src/modern_toast_functions.dart';
