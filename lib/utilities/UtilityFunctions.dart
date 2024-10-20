import 'dart:ui';
import 'package:flutter/material.dart';

class UtilityFunctions{

  // List of vibrant base colors
  static final List<Color> baseColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
  ];

  //Method to generate shades of colors
  static Color getVibrantShade(String character) {
    // Get the ASCII value of the character
    int asciiValue = character.codeUnitAt(0);

    // Choose a base color based on ASCII value
    int colorIndex = asciiValue % baseColors.length;
    Color baseColor = baseColors[colorIndex];

    int r = (baseColor.red * 0.7).toInt();
    int g = (baseColor.green * 0.7).toInt();
    int b = (baseColor.blue * 0.7).toInt();

    return Color.fromARGB(255, r, g, b);
  }

  static String capitalizeEachWord(String text) {
    List<String> words = text.split(' ');

    // Limit to first 5 words if more than 5
    if (words.length > 4) {
      words = words.sublist(0, 4);
      // Capitalize each word
      words = words.map((word) {
        if (word.isEmpty) return word; // If word is empty, skip it
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }).toList();

      words.add('...');
    }
    else{
      // just Capitalize each word
      words = words.map((word) {
        if (word.isEmpty) return word;
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }).toList();
    }
    return words.join(' ');
  }

}