import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lead_do_it_test/style/palette.dart';

class IconGoBack extends StatelessWidget {
  const IconGoBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: Palette.accentPrimary,
          borderRadius: BorderRadius.circular(12.0),
          // Set radius for a circular border
          border: Border.all(
            color: Palette.accentPrimary, // Set the border color
          ),
        ),
        child: Center(
          child: SvgPicture.asset('asset/icons/Vector2.svg'),
        ),
      ),
    );
  }
}
