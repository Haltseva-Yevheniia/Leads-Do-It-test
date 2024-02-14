import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lead_do_it_test/screens/search_screen/view/search_screen_view.dart';
import 'package:lead_do_it_test/style/font_styles.dart';
import 'package:lead_do_it_test/style/palette.dart';

import '../../../constants.dart';

class LoadingScreenView extends StatefulWidget {
  const LoadingScreenView({super.key});

  @override
  State<LoadingScreenView> createState() => _LoadingScreenViewState();
}

class _LoadingScreenViewState extends State<LoadingScreenView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SearchScreenView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palette.accentPrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(loadingText, style: FontStyles.headerMainWhite),
            SizedBox(
              height: 16,
            ),
            CupertinoActivityIndicator(
              radius: 22,
              color: Palette.spinner,
            ),
          ],
        ),
      ),
    );
  }
}
