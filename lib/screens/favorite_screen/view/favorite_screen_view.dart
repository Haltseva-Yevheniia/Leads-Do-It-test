import 'package:flutter/material.dart';
import 'package:lead_do_it_test/style/font_styles.dart';
import 'package:lead_do_it_test/widgets/icon_go_back.dart';

import '../../../constants.dart';

class FavoriteScreenView extends StatelessWidget {
  const FavoriteScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          navigationBarFavoriteScreen,
          style: FontStyles.headerMain,
        ),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 9),
          child: IconGoBack(),
        ),
      ),
      body: Container(),
    );
  }
}
