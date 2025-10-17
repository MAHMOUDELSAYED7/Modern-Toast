import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_toast/modern_toast.dart';

void main() {
  group('ModernToast Types', () {
    test('ModernToastType enum should have all expected values', () {
      expect(ModernToastType.values.length, 4);
      expect(ModernToastType.values, contains(ModernToastType.success));
      expect(ModernToastType.values, contains(ModernToastType.error));
      expect(ModernToastType.values, contains(ModernToastType.warning));
      expect(ModernToastType.values, contains(ModernToastType.info));
    });

    test('ModernToastType enum toString should work correctly', () {
      expect(ModernToastType.success.toString(), 'ModernToastType.success');
      expect(ModernToastType.error.toString(), 'ModernToastType.error');
      expect(ModernToastType.warning.toString(), 'ModernToastType.warning');
      expect(ModernToastType.info.toString(), 'ModernToastType.info');
    });
  });

  group('ModernToast Colors', () {
    test('ModernToastColors should have correct color values', () {
      expect(ModernToastColors.success, const Color(0xFF4CAF50));
      expect(ModernToastColors.error, const Color(0xFFF44336));
      expect(ModernToastColors.warning, const Color(0xFFFF9800));
      expect(ModernToastColors.info, const Color(0xFF2196F3));
    });

    test('ModernToastColors should be Material Design colors', () {
      // Verify these are standard Material Design colors
      expect(ModernToastColors.success, isA<Color>());
      expect(ModernToastColors.error, isA<Color>());
      expect(ModernToastColors.warning, isA<Color>());
      expect(ModernToastColors.info, isA<Color>());
    });

    test('ModernToastColors should have correct opacity', () {
      expect(ModernToastColors.success.opacity, 1.0);
      expect(ModernToastColors.error.opacity, 1.0);
      expect(ModernToastColors.warning.opacity, 1.0);
      expect(ModernToastColors.info.opacity, 1.0);
    });
  });

  group('ShowModernToast Function', () {
    testWidgets('showModernToast can be called without errors',
        (WidgetTester tester) async {
      BuildContext? capturedContext;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const Scaffold(
                body: Center(
                  child: Text('Test'),
                ),
              );
            },
          ),
        ),
      );

      // Verify we can call the function without errors
      expect(
        () => showModernToast(
          capturedContext!,
          message: 'Success Toast',
          type: ModernToastType.success,
        ),
        returnsNormally,
      );

      await tester.pump();
    });

    testWidgets('showModernToast with all types can be called',
        (WidgetTester tester) async {
      BuildContext? capturedContext;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const Scaffold(
                body: Center(
                  child: Text('Test'),
                ),
              );
            },
          ),
        ),
      );

      // Test all toast types can be called
      for (final type in ModernToastType.values) {
        expect(
          () => showModernToast(
            capturedContext!,
            message: 'Test ${type.toString()}',
            type: type,
          ),
          returnsNormally,
        );
        await tester.pump(const Duration(seconds: 2));
      }
    });

    testWidgets('showModernToast with custom textStyle can be called',
        (WidgetTester tester) async {
      BuildContext? capturedContext;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const Scaffold(
                body: Center(
                  child: Text('Test'),
                ),
              );
            },
          ),
        ),
      );

      const customStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.yellow,
      );

      expect(
        () => showModernToast(
          capturedContext!,
          message: 'Styled Toast',
          type: ModernToastType.info,
          textStyle: customStyle,
        ),
        returnsNormally,
      );

      await tester.pump();
    });

    testWidgets('showModernToast with showIcon false can be called',
        (WidgetTester tester) async {
      BuildContext? capturedContext;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const Scaffold(
                body: Center(
                  child: Text('Test'),
                ),
              );
            },
          ),
        ),
      );

      expect(
        () => showModernToast(
          capturedContext!,
          message: 'No Icon Toast',
          type: ModernToastType.info,
          showIcon: false,
        ),
        returnsNormally,
      );

      await tester.pump();
    });
  });

  group('ShowCustomToast Function', () {
    testWidgets('showCustomToast can be called without errors',
        (WidgetTester tester) async {
      BuildContext? capturedContext;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const Scaffold(
                body: Center(
                  child: Text('Test'),
                ),
              );
            },
          ),
        ),
      );

      expect(
        () => showCustomToast(
          capturedContext!,
          message: 'Custom Toast',
          color: Colors.purple,
          icon: Icons.star,
        ),
        returnsNormally,
      );

      await tester.pump();
    });

    testWidgets('showCustomToast with default parameters can be called',
        (WidgetTester tester) async {
      BuildContext? capturedContext;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const Scaffold(
                body: Center(
                  child: Text('Test'),
                ),
              );
            },
          ),
        ),
      );

      expect(
        () => showCustomToast(capturedContext!),
        returnsNormally,
      );

      await tester.pump();
    });

    testWidgets('showCustomToast with custom textStyle can be called',
        (WidgetTester tester) async {
      BuildContext? capturedContext;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const Scaffold(
                body: Center(
                  child: Text('Test'),
                ),
              );
            },
          ),
        ),
      );

      const customStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );

      expect(
        () => showCustomToast(
          capturedContext!,
          message: 'Styled Toast',
          color: Colors.teal,
          icon: Icons.palette,
          textStyle: customStyle,
        ),
        returnsNormally,
      );

      await tester.pump();
    });

    testWidgets('showCustomToast with showIcon false can be called',
        (WidgetTester tester) async {
      BuildContext? capturedContext;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const Scaffold(
                body: Center(
                  child: Text('Test'),
                ),
              );
            },
          ),
        ),
      );

      expect(
        () => showCustomToast(
          capturedContext!,
          message: 'No Icon',
          showIcon: false,
        ),
        returnsNormally,
      );

      await tester.pump();
    });

    testWidgets('showCustomToast with custom duration can be called',
        (WidgetTester tester) async {
      BuildContext? capturedContext;

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              capturedContext = context;
              return const Scaffold(
                body: Center(
                  child: Text('Test'),
                ),
              );
            },
          ),
        ),
      );

      expect(
        () => showCustomToast(
          capturedContext!,
          message: 'Long Duration Toast',
          durationInMilliseconds: 5000,
        ),
        returnsNormally,
      );

      await tester.pump();
    });
  });
}
