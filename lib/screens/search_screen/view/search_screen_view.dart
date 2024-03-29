import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_do_it_test/screens/favorite_screen/view/favorite_screen_view.dart';
import 'package:lead_do_it_test/screens/search_screen/bloc/search_screen_bloc.dart';
import 'package:lead_do_it_test/screens/search_screen/view/search_screen.dart';
import 'package:lead_do_it_test/style/font_styles.dart';

import '../../../constants.dart';
import '../../../widgets/icon_favorite_list.dart';

class SearchScreenView extends StatelessWidget {
  const SearchScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          navigationBarSearchScreen,
          style: FontStyles.headerMain,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoriteScreenView()));
                },
                child: const IconFavoriteList()),
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => SearchScreenBloc()..add(SearchScreenInitialEvent()),
        //path to our SearchScreenBloc and default State
        child: const SearchScreen(),
      ),
    );
  }
}
