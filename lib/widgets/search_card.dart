import 'package:flutter/material.dart';
import 'package:lead_do_it_test/style/palette.dart';

class SearchCard extends StatelessWidget {
  final String name;

  //final bool isFavorite;
  final Widget trailing;

  const SearchCard({
    super.key,
    required this.name,

    //required this.isFavorite,
    this.trailing = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Palette.layer1),
        child: ListTile(
          title: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: trailing,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
