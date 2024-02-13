import 'package:flutter/material.dart';
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
    return ListTile(
      title: Text(name),
      trailing: const IconStar(),
    );
  }
}
