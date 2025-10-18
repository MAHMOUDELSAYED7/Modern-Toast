## [0.0.5] - 2025-10-18

### Fixed
- Minor comment formatting fixes in library documentation

## [0.0.4] - 2025-10-18

### Added
- Comprehensive API documentation for all public classes and methods
- Library-level documentation with usage examples
- Documentation for `ModernToastColors` class and all color constants

### Changed
- Updated `animate_do` dependency to version ^4.0.0 for latest features and bug fixes
- Improved README with centered video demo

### Fixed
- Code formatting issues for better pub.dev score
- Missing documentation comments for better API coverage

## [0.0.3] - 2025-10-18

### Added
- `borderRadius` parameter to `showModernToast` for customizing toast corner radius (default: 25.0)
- Example demonstrating custom border radius in the example app

### Changed
- Updated API documentation to include the new `borderRadius` parameter

## [0.0.2] - 2025-10-18

### Added
- `textStyle` parameter to `showModernToast` for custom text styling
- `showIcon` boolean parameter to hide/show icons (default: true)
- Refactored code into smaller files following single responsibility principle:
  - `modern_toast_types.dart` - Contains enums and color constants
  - `modern_toast_functions.dart` - Contains the main toast functions
  - `top_toast.dart` - Contains the TopToast widget

### Removed
- `flutter_screenutil` dependency - package now works without additional setup
- Replaced responsive sizing with fixed pixel values

### Changed
- Updated example app to demonstrate new features
- Improved code organization and maintainability

## [0.0.1] - 2025-10-18

### Added
- Initial release of Modern Toast package
- Four predefined toast types: Success, Error, Warning, and Info
- Custom toast function with customizable colors and icons
- Smooth zoom-in and slide-down animations using animate_do
- Responsive design using flutter_screenutil
- Auto-dismiss functionality with customizable duration
- Smart debouncing to prevent multiple toasts from showing at once
- Automatic width adjustment based on message content
- Support for up to 3 lines of text with ellipsis overflow
- Beautiful shadow effects and rounded corners
- SafeArea support for proper display on all devices

### Features
- `showModernToast()` - Display predefined toast types
- `showModernToast()` - Display toasts with predefined types or custom styling
- `ModernToastType` enum - Success, Error, Warning, Info
- `ModernToastColors` class - Default color palette
