import 'package:flutter/material.dart';

import 'modern_toast_types.dart';
import 'top_toast.dart';

/// Track the last snackbar time to prevent showing multiple toasts at once
DateTime? _lastSnackBarTime;

/// Shows a modern toast notification with predefined types or custom styling
///
/// [context] - BuildContext of the current widget
/// [message] - The message to display in the toast (required)
/// [type] - The type of toast (success, error, warning, info). If null, custom color/icon must be provided
/// [color] - Custom background color for the toast (used when type is null)
/// [icon] - Custom icon to display (used when type is null)
/// [durationInMilliseconds] - Duration for which toast should be visible (default: 3000ms)
/// [textStyle] - Custom text style for the toast message
/// [showIcon] - Whether to show the icon (default: true)
/// [borderRadius] - Border radius for the toast container (default: 25.0)
/// [actionLabel] - Optional action button label (not yet implemented)
/// [onActionPressed] - Optional action button callback (not yet implemented)
void showModernToast(
  BuildContext context, {
  required String message,
  ModernToastType? type,
  Color? color,
  IconData? icon,
  int? durationInMilliseconds,
  TextStyle? textStyle,
  bool showIcon = true,
  double borderRadius = 25.0,
  String? actionLabel,
  VoidCallback? onActionPressed,
}) {
  Color backgroundColor;
  IconData toastIcon;

  if (type != null) {
    // Use predefined type
    switch (type) {
      case ModernToastType.success:
        backgroundColor = ModernToastColors.success;
        toastIcon = Icons.check_circle_outline;
        break;
      case ModernToastType.error:
        backgroundColor = ModernToastColors.error;
        toastIcon = Icons.error_outline;
        break;
      case ModernToastType.warning:
        backgroundColor = ModernToastColors.warning;
        toastIcon = Icons.warning_amber_outlined;
        break;
      case ModernToastType.info:
        backgroundColor = ModernToastColors.info;
        toastIcon = Icons.info_outline;
        break;
    }
  } else {
    // Use custom styling
    backgroundColor = color ?? ModernToastColors.info;
    toastIcon = icon ?? Icons.info_outline;
  }

  final now = DateTime.now();

  // Prevent showing multiple toasts within 1 second
  if (_lastSnackBarTime != null &&
      now.difference(_lastSnackBarTime!) < const Duration(seconds: 1)) {
    return;
  }

  _lastSnackBarTime = now;

  final overlay = Overlay.of(context);
  late final OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) => TopToast(
      message: message,
      color: backgroundColor,
      icon: toastIcon,
      durationInMilliseconds: durationInMilliseconds ?? 3000,
      textStyle: textStyle,
      showIcon: showIcon,
      borderRadius: borderRadius,
      onRemove: () => overlayEntry.remove(),
    ),
  );

  overlay.insert(overlayEntry);
}
