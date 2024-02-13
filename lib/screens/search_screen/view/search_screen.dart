import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_do_it_test/screens/search_screen/bloc/search_screen_bloc.dart';
import 'package:lead_do_it_test/screens/search_screen/widgets/search_bar_widget.dart';
import 'package:lead_do_it_test/style/font_styles.dart';
import 'package:lead_do_it_test/widgets/search_card.dart';

import '../../../constants.dart';
import '../../../style/palette.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchScreenBloc, SearchScreenState>(
        builder: (context, state) {
      if (state.status == SearchScreenStatus.initialHistory) {
        return Column(
          children: [
            const Divider(height: 1, thickness: 1, color: Palette.layer1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SearchBarWidget(),
                  ),
                  Text(
                    searchHistory,
                    textAlign: TextAlign.left,
                    style: FontStyles.headerMain,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: state.isHistoryEmpty
                    ? Center(
                        child: Text(
                          emptyHistory,
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
      if (state.status == SearchScreenStatus.loading) {
        return const Column(children: [
          Divider(height: 1, thickness: 1, color: Palette.layer1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SearchBarWidget(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Center(
            child: CupertinoActivityIndicator(
              radius: 22,
              color: Palette.spinner,
            ),
          ),
        ]);
      }
      if (state.status == SearchScreenStatus.success) {
        return Column(
          children: [
            const Divider(height: 1, thickness: 1, color: Palette.layer1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SearchBarWidget(),
                  ),
                  Text(searchResultHeader),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: state.searchHistory.length,
                  itemBuilder: (context, index) {
                    return SearchCard(name: state.repositories[index].name);
                  }),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            const Divider(height: 1, thickness: 1, color: Palette.layer1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SearchBarWidget(),
                  ),
                  Text(
                    emptySearchResultHeader,
                    textAlign: TextAlign.left,
                    style: FontStyles.headerMain,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                    child: Center(
              child: Text(
                emptySearchResultBody,
                textAlign: TextAlign.center,
              ),
            )))
          ],
        );
      }
    });
  }
}
