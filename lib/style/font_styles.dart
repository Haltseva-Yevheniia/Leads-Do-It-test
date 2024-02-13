
import 'package:flutter/material.dart';

class FontStyles {
  final Color color;
   FontStyles ({required this.color});

static const TextStyle headerMain = TextStyle(
    fontFamily: 'Raleway',
   // color: color,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

static const TextStyle body = TextStyle(
  fontFamily: 'Raleway',
  fontWeight: FontWeight.w600,
  fontSize: 14,
);
}