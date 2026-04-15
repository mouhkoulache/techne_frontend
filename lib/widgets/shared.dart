import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// THE REUSABLE CARD
Widget techneCard({required Widget child, Color? color}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.black.withOpacity(0.05)),
      // FIXED: Changed 'shadows' to 'boxShadow'
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.02), 
          blurRadius: 10, 
          offset: const Offset(0, 4),
        )
      ],
    ),
    child: child,
  );
}

// THE REUSABLE TEXT STYLE
TextStyle techneDisplay({double size = 22, bool italic = true, Color? color}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.bold,
    fontStyle: italic ? FontStyle.italic : FontStyle.normal,
    color: color ?? AppColors.primaryGreen,
    letterSpacing: -0.5,
    fontFamily: 'Newsreader', // This matches your HTML font
  );
}