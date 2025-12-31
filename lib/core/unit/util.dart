import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  
  // Try to load Google Fonts, fallback to system fonts if it fails
  TextTheme bodyTextTheme;
  TextTheme displayTextTheme;
  
  try {
    // Check if AssetManifest is available before trying to load fonts
    // This prevents errors during hot reload or if the app wasn't properly built
    bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
    displayTextTheme = GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  } catch (e) {
    // If Google Fonts fails to load (e.g., AssetManifest.json issue), use system fonts
    // This can happen during hot reload or if flutter clean/pub get wasn't run
    bodyTextTheme = baseTextTheme;
    displayTextTheme = baseTextTheme;
  }
  
  // Additional safety check - if fonts failed to load, ensure we have valid text themes
  if (bodyTextTheme.bodyLarge == null || displayTextTheme.headlineLarge == null) {
    bodyTextTheme = baseTextTheme;
    displayTextTheme = baseTextTheme;
  }
  
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}
