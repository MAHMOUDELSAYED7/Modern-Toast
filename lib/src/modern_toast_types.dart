import 'package:flutter/material.dart';

/// Enum to define different types of toast notifications
enum ModernToastType { success, error, warning, info }

/// Default colors for different toast types
class ModernToastColors {
  static const Color success = Color(0xFF34A853);
  static const Color error = Color(0xFFFF0000);
  static const Color warning = Color(0xFFFFA000);
  static const Color info = Color(0xFF2196F3);
  static const Color white = Color(0xFFFFFFFF);
}
