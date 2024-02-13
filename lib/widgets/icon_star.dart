import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lead_do_it_test/style/palette.dart';

class IconStar extends StatelessWidget {
  const IconStar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: Palette.layer1,
        borderRadius: BorderRadius.circular(12.0),
        // Set radius for a circular border
        border: Border.all(
          color: Palette.layer1, // Set the border color
        ),
      ),
      child: Center(
        child: SvgPicture.asset('asset/icons/Vector.svg',
            colorFilter:
                const ColorFilter.mode(Palette.accentPrimary, BlendMode.srcIn)),
      ),
    );
  }
}
