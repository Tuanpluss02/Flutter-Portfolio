import 'package:flutter/material.dart';

enum ScreenType { mobile, web }

/// Screen utility functions
abstract final class ScreenInfo {
  /// Get screen type based on width breakpoints
  static ScreenType getScreenType(BuildContext context) {
    final width = getWidth(context);
    if (width > 915) {
      return ScreenType.web;
    } else if (width < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.web;
  }

  /// Get screen width
  static double getWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  /// Get screen height
  static double getHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }
}
