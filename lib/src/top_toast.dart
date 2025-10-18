import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'modern_toast_types.dart';

/// Internal widget that displays the actual toast notification
class TopToast extends StatefulWidget {
  /// The message to display in the toast
  final String message;

  /// The background color of the toast
  final Color color;

  /// The icon to display in the toast
  final IconData icon;

  /// Duration in milliseconds before the toast auto-dismisses
  final int durationInMilliseconds;

  /// Custom text style for the toast message
  final TextStyle? textStyle;

  /// Whether to show the icon in the toast
  final bool showIcon;

  /// Border radius for the toast container corners
  final double borderRadius;

  /// Callback function called when the toast should be removed
  final VoidCallback onRemove;

  const TopToast({
    super.key,
    required this.message,
    required this.color,
    required this.icon,
    required this.durationInMilliseconds,
    this.textStyle,
    this.showIcon = true,
    this.borderRadius = 25.0,
    required this.onRemove,
  });

  @override
  State<TopToast> createState() => _TopToastState();
}

class _TopToastState extends State<TopToast>
    with SingleTickerProviderStateMixin {
  /// Animation controller for the slide-in/slide-out animation
  late AnimationController _controller;

  /// Animation for the vertical slide transition
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller with 300ms duration
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();

    // Create slide animation from top (offset -1) to center (offset 0)
    _animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Auto-dismiss the toast after the specified duration
    Future.delayed(Duration(milliseconds: widget.durationInMilliseconds), () {
      if (mounted) {
        _controller.reverse().then((_) {
          if (mounted) {
            widget.onRemove();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get default text style from theme, with white color and medium weight
    final defaultTextStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        );

    // Use custom text style if provided, otherwise use default
    final textStyle = widget.textStyle ?? defaultTextStyle;

    // Constants for layout calculations
    const horizontalPadding = 32.0 * 2; // 64.0 total horizontal padding
    const iconWidth = 24.0;
    const spacing = 8.0;

    // Get screen dimensions for responsive sizing
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final availableContainerWidth = screenWidth * 0.8; // 80% of screen width

    double containerWidth = availableContainerWidth;

    // Calculate optimal container width based on text content
    if (textStyle != null) {
      final effectiveTextStyle = textStyle;

      // Measure intrinsic text width
      final textPainterIntrinsic = TextPainter(
        text: TextSpan(text: widget.message, style: effectiveTextStyle),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      );
      textPainterIntrinsic.layout();
      final intrinsicTextWidth = textPainterIntrinsic.width;

      // Calculate total width needed including padding and icon
      final intrinsicContainerWidth = intrinsicTextWidth +
          horizontalPadding +
          (widget.showIcon ? iconWidth + spacing : 0);

      if (intrinsicContainerWidth <= availableContainerWidth) {
        containerWidth = intrinsicContainerWidth;
      } else {
        // Calculate available width for text when container is at max width
        final availableTextWidth = availableContainerWidth -
            horizontalPadding -
            (widget.showIcon ? iconWidth + spacing : 0);

        // Check if text fits in available space with wrapping
        final textPainterWrapped = TextPainter(
          text: TextSpan(text: widget.message, style: effectiveTextStyle),
          maxLines: 3,
          textDirection: TextDirection.ltr,
        );
        textPainterWrapped.layout(maxWidth: availableTextWidth);

        if (textPainterWrapped.didExceedMaxLines) {
          // Text doesn't fit, expand container width
          containerWidth = (intrinsicTextWidth + horizontalPadding).clamp(
            availableContainerWidth,
            screenWidth * 0.9, // Max 90% of screen width
          );
        } else {
          // Text fits, use standard container width
          containerWidth = availableContainerWidth;
        }
      }

      // Ensure container width stays within reasonable bounds
      containerWidth = containerWidth.clamp(0, screenWidth * 0.9);
    }

    // Build the toast widget with animations and styling
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ZoomIn(
              duration: const Duration(milliseconds: 600),
              child: SlideTransition(
                position: _animation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: containerWidth,
                      decoration: BoxDecoration(
                        color: widget.color.withValues(alpha: 0.95),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        boxShadow: [
                          BoxShadow(
                            color: widget.color.withValues(alpha: 0.5),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 28,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (widget.showIcon) ...[
                              ZoomIn(
                                delay: const Duration(milliseconds: 400),
                                child: Icon(
                                  widget.icon,
                                  color: ModernToastColors.white,
                                  size: 20.0,
                                ),
                              ),
                              const SizedBox(width: spacing),
                            ],
                            Expanded(
                              child: Text(
                                widget.message,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: textStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
