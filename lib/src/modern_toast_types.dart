import 'package:flutter/material.dart';

/// Enum to define different types of toast notifications
enum ModernToastType { success, error, warning, info }

/// Default colors for different toast types and utility colors.
///
/// This class provides predefined colors that match the design system
/// and can be used for consistent styling across toast notifications.
class ModernToastColors {
  /// Constructor for ModernToastColors.
  const ModernToastColors();

  /// Success color - Green (#34A853)
  /// Used for success toast notifications and positive feedback.
  static const Color success = Color(0xFF34A853);

  /// Error color - Red (#FF0000)
  /// Used for error toast notifications and negative feedback.
  static const Color error = Color(0xFFFF0000);

  /// Warning color - Orange (#FFA000)
  /// Used for warning toast notifications and caution messages.
  static const Color warning = Color(0xFFFFA000);

  /// Info color - Blue (#2196F3)
  /// Used for informational toast notifications.
  static const Color info = Color(0xFF2196F3);

  /// White color - White (#FFFFFFFF)
  /// Utility color for text and icons on colored backgrounds.
  static const Color white = Color(0xFFFFFFFF);
}
