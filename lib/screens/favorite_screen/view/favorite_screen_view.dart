import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_do_it_test/screens/favorite_screen/bloc/favorite_screen_bloc.dart';
import 'package:lead_do_it_test/style/font_styles.dart';
import 'package:lead_do_it_test/widgets/icon_go_back.dart';
import 'package:lead_do_it_test/widgets/search_card.dart';

import '../../../constants.dart';
import '../../../style/palette.dart';
import '../../../widgets/icon_not_favor_star.dart';
import '../../../widgets/icon_star.dart';

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
        body: BlocProvider(
            create: (_) => FavoriteScreenBloc()..add(FetchFavoriteRepos()),
            child: const FavoriteScreen()));
  }
}

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteScreenBloc, FavoriteScreenState>(
        builder: (context, state) {
      if (state is FavoriteScreenLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is FavoriteScreenSuccess) {
        return ListView.builder(
            itemCount: state.favoriteRepos.length,
            itemBuilder: (BuildContext context, int index) {
              return state.favoriteRepos.isNotEmpty
                  ? SearchCard(
                      trailing: GestureDetector(
                          onTap: () {
                            context
                                .read<FavoriteScreenBloc>()
                                .add(ToggleFavoriteRepos(
                                  id: state.favoriteRepos[index].id!,
                                  name: state.favoriteRepos[index].name!,
                                ));
                          },
                          child: const IconStar()
                          // state.isFavorite
                          //     ? const IconStar()
                          //     : const IconNotFavoriteStar(),
              ),
                      name: state.favoriteRepos[index].name!)
                  : const SizedBox.shrink();
            });
      }
if(state is ToggleFavorite) {
  return ListView.builder(
      itemCount: state.favoriteRepos.length,
      itemBuilder: (BuildContext context, int index) {
        return state.favoriteRepos.isNotEmpty
            ? SearchCard(
            trailing: GestureDetector(
                onTap: () {
                  context
                      .read<FavoriteScreenBloc>()
                      .add(ToggleFavoriteRepos(
                    id: state.favoriteRepos[index].id!,
                    name: state.favoriteRepos[index].name!,
                  ));
                },
                child: const IconStar()
              // state.isFavorite
              //     ? const IconStar()
              //     : const IconNotFavoriteStar(),
            ),
            name: state.favoriteRepos[index].name!)
            : const SizedBox.shrink();
      });
}
      else {
        return Column(
          children: [
            const Divider(height: 1, thickness: 1, color: Palette.layer1),
            Expanded(
                child: Container(
              child: const Center(
                child: Text(
                  favoriteScreenEmptyBody,
                  textAlign: TextAlign.center,
                ),
              ),
            )),
          ],
        );
      }
    });
  }
}
