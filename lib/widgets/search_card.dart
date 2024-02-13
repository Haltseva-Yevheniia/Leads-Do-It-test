import 'package:flutter/material.dart';
import 'package:lead_do_it_test/style/palette.dart';
import 'package:lead_do_it_test/widgets/icon_star.dart';

class SearchCard extends StatelessWidget {

  final String name;
  //final bool isFavorite;

  const SearchCard({
    super.key,
    required this.name,
    //required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        color: Palette.layer1,
        child: ListTile(
          title: Text(name, overflow: TextOverflow.ellipsis,),
          trailing: const IconStar(),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
