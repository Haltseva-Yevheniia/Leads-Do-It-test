import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lead_do_it_test/screens/search_screen/bloc/search_screen_bloc.dart';

import '../../../constants.dart';
import '../../../style/style.dart';
import '../../../widgets/project_widgets.dart';
import '../widgets/search_screen_widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _scrollController = ScrollController();

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
  
  void _onScroll () {
    if (_isBottom) {context.read<SearchScreenBloc>().add(FetchReposEvent(name: name))}
  }
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchScreenBloc, SearchScreenState>(
        builder: (context, state) {
      if (state is GotHistoryState) {
        return Column(
          children: [
            const Divider(height: 1, thickness: 1, color: Palette.layer1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SearchBarWidget(),
                  ),
                  Text(
                    searchHistory,
                    textAlign: TextAlign.left,
                    style: FontStyles.headerMainAccent,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: state.isHistoryEmpty
                    ? const Center(
                        child: Text(
                          emptyHistory,
                          style: FontStyles.bodyPlaceHolder,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        itemCount: state.searchHistory.length,
                        itemBuilder: (context, index) {
                          return SearchCard(
                            name: state.searchHistory[index],
                          );
                        }),
              ),
            )
          ],
        );
      }
      if (state is SearchScreenLoadingState) {
        return Column(children: [
          const Divider(height: 1, thickness: 1, color: Palette.layer1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchBarWidget(
                    trailing: SvgPicture.asset('asset/icons/Close.svg'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Center(
            child: CupertinoActivityIndicator(
              radius: 22,
              color: Palette.spinner,
            ),
          ),
        ]);
      }
      if (state is FetchReposSuccessState) {
        //TODO eventFetchRepos when scroll to down part of page
        return Column(
          children: [
            const Divider(height: 1, thickness: 1, color: Palette.layer1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchBarWidget(
                      trailing: SvgPicture.asset(
                        'asset/icons/Close.svg',
                      ),
                    ),
                  ),
                  const Text(
                    searchResultHeader,
                    style: FontStyles.headerMainAccent,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(

                  itemCount: state.repositories.length,
                  itemBuilder: (context, index) {
                    return SearchCard(
                      name: state.repositories[index].name,
                      trailing: GestureDetector(
                          onTap: () {
                            context.read<SearchScreenBloc>().add(
                                  ToggleFavoriteRepos(
                                    id: state.repositories[index].id,
                                    name: state.repositories[index].name,
                                    repositories: state.repositories,
                                  ),
                                );
                          },
                          child: state.favoritesFromCurrentListId
                                  .contains(state.repositories[index].id)
                              ? const IconStar()
                              : const IconNotFavoriteStar()),
                    );
                  }),
            ),
          ],
        );
      }
      if (state is ToggleSearchCardState) {
        return Column(
          children: [
            dividerAppBar,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchBarWidget(
                      trailing: SvgPicture.asset(
                        'asset/icons/Close.svg',
                      ),
                    ),
                  ),
                  const Text(
                    searchResultHeader,
                    style: FontStyles.headerMainAccent,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: state.repositories.length,
                  itemBuilder: (context, index) {
                    return SearchCard(
                      name: state.repositories[index].name,
                      trailing: GestureDetector(
                          onTap: () {
                            context.read<SearchScreenBloc>().add(
                                  ToggleFavoriteRepos(
                                    id: state.repositories[index].id,
                                    name: state.repositories[index].name,
                                    repositories: state.repositories,
                                  ),
                                );
                          },
                          child: state.favoritesFromCurrentListId
                                  .contains(state.repositories[index].id)
                              ? const IconStar()
                              : const IconNotFavoriteStar()),
                    );
                  }),
            ),
          ],
        );
      } else {
        return const SearchScreenFailureWidget();
      }
    });
  }
}
