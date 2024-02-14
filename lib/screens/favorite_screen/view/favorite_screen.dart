import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../widgets/project_widgets.dart';
import '../bloc/favorite_screen_bloc.dart';
import '../widgets/favorite_screen_widgets.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteScreenBloc, FavoriteScreenState>(
        builder: (context, state) {
      if (state is FavoriteScreenLoading) {
        return const FavoriteScreenLoadingWidget();
      }
      if (state is FavoriteScreenSuccess) {
        if (state.favoriteRepos.isNotEmpty) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: state.favoriteRepos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchCard(
                          trailing: GestureDetector(
                              onTap: () {
                                context.read<FavoriteScreenBloc>().add(
                                      ToggleFavoriteRepos(
                                        id: state.favoriteRepos[index].id!,
                                        name: state.favoriteRepos[index].name!,
                                      ),
                                    );
                              },
                              child: const IconStar()),
                          name: state.favoriteRepos[index].name!);
                    }),
              ),
            ],
          );
        } else {
          return const FailureStateWidget(text: favoriteScreenEmptyBody);
        }
      }
      if (state is ToggleFavorite) {
        return Column(
          children: [
            dividerAppBar,
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: state.favoriteRepos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return state.favoriteRepos.isNotEmpty
                        ? SearchCard(
                            trailing: GestureDetector(
                                onTap: () {
                                  context.read<FavoriteScreenBloc>().add(
                                        ToggleFavoriteRepos(
                                          id: state.favoriteRepos[index].id!,
                                          name:
                                              state.favoriteRepos[index].name!,
                                        ),
                                      );
                                },
                                child: const IconStar()),
                            name: state.favoriteRepos[index].name!)
                        : const SizedBox.shrink();
                  }),
            ),
          ],
        );
      } else {
        return const FailureStateWidget(
          text: favoriteScreenEmptyBody,
        );
      }
    });
  }
}
