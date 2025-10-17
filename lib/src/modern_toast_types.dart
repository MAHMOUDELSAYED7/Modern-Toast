import 'package:flutter/material.dart';

/// Enum to define different types of toast notifications
enum ModernToastType { success, error, warning, info }

/// Default colors for different toast types
class ModernToastColors {
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
  static const Color white = Color(0xFFFFFFFF);
}
