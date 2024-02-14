import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_do_it_test/screens/favorite_screen/bloc/favorite_screen_bloc.dart';
import 'package:lead_do_it_test/style/font_styles.dart';

import '../../../constants.dart';
import '../widgets/favorite_screen_widgets.dart';
import 'favorite_screen.dart';

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
          automaticallyImplyLeading: true,
          leading: const LeadingAppBar(),
        ),
        body: BlocProvider(
            create: (_) => FavoriteScreenBloc()..add(FetchFavoriteRepos()),
            child: const FavoriteScreen()));
  }
}
