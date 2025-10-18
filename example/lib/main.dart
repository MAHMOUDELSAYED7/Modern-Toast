import 'package:flutter/material.dart';
import 'package:modern_toast/modern_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ModernToast Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showSuccessToast() {
    showModernToast(
      context,
      message: 'Operation completed successfully! 🎉',
      type: ModernToastType.success,
    );
  }

  void _showErrorToast() {
    showModernToast(
      context,
      message: 'Oops! Something went wrong. Please try again.',
      type: ModernToastType.error,
    );
  }

  void _showWarningToast() {
    showModernToast(
      context,
      message: 'Warning! Please check your input before proceeding.',
      type: ModernToastType.warning,
    );
  }

  void _showInfoToast() {
    showModernToast(
      context,
      message: 'This is an informational message for you.',
      type: ModernToastType.info,
    );
  }

  void _showLongDurationToast() {
    showModernToast(
      context,
      message: 'This toast will stay visible for 5 seconds!',
      type: ModernToastType.success,
      durationInMilliseconds: 5000,
    );
  }

  void _showLongMessageToast() {
    showModernToast(
      context,
      message:
          'This is a very long message that demonstrates how the toast handles multiple lines of text. The container will automatically adjust its width and the text will wrap properly.',
      type: ModernToastType.info,
      durationInMilliseconds: 5000,
    );
  }

  void _showCustomToast() {
    showModernToast(
      context,
      message: 'Custom purple toast with star icon! ⭐',
      color: Colors.purple,
      icon: Icons.star,
      durationInMilliseconds: 4000,
    );
  }

  void _showCustomTextStyleToast() {
    showModernToast(
      context,
      message: 'Custom styled text! Bold and larger font.',
      type: ModernToastType.success,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  void _showNoIconToast() {
    showModernToast(
      context,
      message: 'This toast has no icon!',
      type: ModernToastType.info,
      showIcon: false,
    );
  }

  void _showCustomToast2() {
    showModernToast(
      context,
      message: 'Custom pink toast with favorite icon! 💖',
      color: Colors.pink,
      icon: Icons.favorite,
      durationInMilliseconds: 4000,
    );
  }

  void _showCustomToastNoIcon() {
    showModernToast(
      context,
      message: 'Custom toast without icon',
      color: Colors.orange,
      showIcon: false,
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  void _showCustomBorderRadiusToast() {
    showModernToast(
      context,
      message: 'Custom border radius toast',
      type: ModernToastType.success,
      borderRadius: 8.0,
    );
  }

  void _showSharpBorderRadiusToast() {
    showModernToast(
      context,
      message: 'Sharp corners toast',
      type: ModernToastType.warning,
      borderRadius: 0.0,
    );
  }

  void _showLargeBorderRadiusToast() {
    showModernToast(
      context,
      message: 'Very rounded toast',
      type: ModernToastType.info,
      borderRadius: 50.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Modern Toast Example'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.notifications_active,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Modern Toast Examples',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Tap the buttons below to see different toast styles',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),

              // Predefined Toast Types
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Predefined Toast Types',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              _buildToastButton(
                icon: Icons.check_circle,
                label: 'Show Success Toast',
                color: ModernToastColors.success,
                onPressed: _showSuccessToast,
              ),
              const SizedBox(height: 12),

              _buildToastButton(
                icon: Icons.error,
                label: 'Show Error Toast',
                color: ModernToastColors.error,
                onPressed: _showErrorToast,
              ),
              const SizedBox(height: 12),

              _buildToastButton(
                icon: Icons.warning,
                label: 'Show Warning Toast',
                color: ModernToastColors.warning,
                onPressed: _showWarningToast,
              ),
              const SizedBox(height: 12),

              _buildToastButton(
                icon: Icons.info,
                label: 'Show Info Toast',
                color: ModernToastColors.info,
                onPressed: _showInfoToast,
              ),

              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 20),

              // Custom Toast Examples
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Custom Toast Examples',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              _buildToastButton(
                icon: Icons.star,
                label: 'Show Custom Toast (Purple)',
                color: Colors.purple,
                onPressed: _showCustomToast,
              ),
              const SizedBox(height: 12),

              _buildToastButton(
                icon: Icons.favorite,
                label: 'Show Custom Toast (Pink)',
                color: Colors.pink,
                onPressed: _showCustomToast2,
              ),

              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 20),

              // New Features Examples
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'New Features',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              _buildToastButton(
                icon: Icons.text_format,
                label: 'Custom Text Style',
                color: Colors.teal,
                onPressed: _showCustomTextStyleToast,
              ),
              const SizedBox(height: 12),

              _buildToastButton(
                icon: Icons.visibility_off,
                label: 'No Icon Toast',
                color: Colors.grey,
                onPressed: _showNoIconToast,
              ),
              const SizedBox(height: 12),

              _buildToastButton(
                icon: Icons.hide_image,
                label: 'Custom Toast (No Icon)',
                color: Colors.deepPurple,
                onPressed: _showCustomToastNoIcon,
              ),
              const SizedBox(height: 20),

              // Border Radius Examples
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Border Radius Examples',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              _buildToastButton(
                icon: Icons.rounded_corner,
                label: 'Custom Border Radius',
                color: Colors.pink,
                onPressed: _showCustomBorderRadiusToast,
              ),
              const SizedBox(height: 12),

              _buildToastButton(
                icon: Icons.crop_square,
                label: 'Sharp Corners (0px)',
                color: Colors.redAccent,
                onPressed: _showSharpBorderRadiusToast,
              ),
              const SizedBox(height: 12),

              _buildToastButton(
                icon: Icons.circle,
                label: 'Very Rounded (50px)',
                color: Colors.lightBlue,
                onPressed: _showLargeBorderRadiusToast,
              ),
              const SizedBox(height: 12),

              _buildToastButton(
                icon: Icons.timer,
                label: 'Long Duration Toast (5s)',
                color: Colors.teal,
                onPressed: _showLongDurationToast,
              ),
              const SizedBox(height: 12),

              _buildToastButton(
                icon: Icons.text_fields,
                label: 'Long Message Toast',
                color: Colors.indigo,
                onPressed: _showLongMessageToast,
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToastButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
      ),
    );
  }
}
