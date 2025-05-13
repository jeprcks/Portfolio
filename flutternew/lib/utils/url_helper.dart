import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class UrlHelper {
  static void openUrl(BuildContext context, String url) {
    try {
      // Show a snackbar to indicate we're opening the link
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Opening: $url')),
      );
      
      // Create a hidden anchor element to open the URL
      final anchorElement = html.AnchorElement(href: url)
        ..target = '_blank'
        ..click();
    } catch (e) {
      debugPrint('Error opening URL: $e');
      // Show error to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open link: $e')),
      );
    }
  }
}
