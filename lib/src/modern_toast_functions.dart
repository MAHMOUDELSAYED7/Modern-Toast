import 'package:flutter/material.dart';

import 'modern_toast_types.dart';
import 'top_snackbar.dart';

/// Track the last snackbar time to prevent showing multiple toasts at once
DateTime? _lastSnackBarTime;

/// Shows a modern toast notification with predefined types
///
/// [context] - BuildContext of the current widget
/// [message] - The message to display in the toast
/// [type] - The type of toast (success, error, warning, info)
/// [durationInMilliseconds] - Duration for which toast should be visible (default: 3000ms)
/// [textStyle] - Custom text style for the toast message
/// [showIcon] - Whether to show the icon (default: true)
/// [actionLabel] - Optional action button label (not yet implemented)
/// [onActionPressed] - Optional action button callback (not yet implemented)
void showModernToast(
  BuildContext context, {
  required String message,
  required ModernToastType type,
  int? durationInMilliseconds,
  TextStyle? textStyle,
  bool showIcon = true,
  String? actionLabel,
  VoidCallback? onActionPressed,
}) {
  Color backgroundColor;
  IconData icon;

  switch (type) {
    case ModernToastType.success:
      backgroundColor = ModernToastColors.success;
      icon = Icons.check_circle_outline;
      break;
    case ModernToastType.error:
      backgroundColor = ModernToastColors.error;
      icon = Icons.error_outline;
      break;
    case ModernToastType.warning:
      backgroundColor = ModernToastColors.warning;
      icon = Icons.warning_amber_outlined;
      break;
    case ModernToastType.info:
      backgroundColor = ModernToastColors.info;
      icon = Icons.info_outline;
      break;
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
    builder: (context) => TopSnackBar(
      message: message,
      color: backgroundColor,
      icon: icon,
      durationInMilliseconds: durationInMilliseconds ?? 3000,
      textStyle: textStyle,
      showIcon: showIcon,
      onRemove: () => overlayEntry.remove(),
    ),
  );

  overlay.insert(overlayEntry);
}

/// Shows a custom toast notification with custom color and icon
///
/// [context] - BuildContext of the current widget
/// [message] - The message to display in the toast (default: 'There was an error, please try again later!')
/// [color] - Custom background color for the toast
/// [icon] - Custom icon to display (default: Icons.error_outline)
/// [durationInMilliseconds] - Duration for which toast should be visible (default: 3000ms)
/// [textStyle] - Custom text style for the toast message
/// [showIcon] - Whether to show the icon (default: true)
void showCustomToast(
  BuildContext context, {
  String? message,
  Color? color,
  IconData? icon,
  int? durationInMilliseconds,
  TextStyle? textStyle,
  bool showIcon = true,
}) {
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
    builder: (context) => TopSnackBar(
      message: message ?? 'There was an error, please try again later!',
      color: color ?? ModernToastColors.info,
      icon: icon ?? Icons.error_outline,
      durationInMilliseconds: durationInMilliseconds ?? 3000,
      textStyle: textStyle,
      showIcon: showIcon,
      onRemove: () => overlayEntry.remove(),
    ),
  );

  overlay.insert(overlayEntry);
}
