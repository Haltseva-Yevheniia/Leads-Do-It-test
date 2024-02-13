import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lead_do_it_test/constants.dart';
import 'package:lead_do_it_test/screens/search_screen/bloc/search_screen_bloc.dart';
import 'package:lead_do_it_test/style/palette.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {


  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final FocusNode _focusNode = FocusNode();
    //bool isEnable = false;

    return GestureDetector(
      onTap: (){
        _focusNode.unfocus();
      },
      child: TextField(
        controller: searchController,
      textInputAction: TextInputAction.done,
      onEditingComplete: (){
        context.read<SearchScreenBloc>().add(ReposFetchedEvent(name: searchController.text));
        searchController.clear();
      },
      focusNode: _focusNode,
      // onTap: (){
      //     context.read<SearchScreenBloc>().add(ReposFetchedEvent(name: searchController.text));
      //     searchController.clear();
      // },
        //keyboardType: TextInputType.text,

        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              'asset/icons/Search.svg', height: 24, width: 24,),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Palette.textPlaceholder),
          //hintStyle: bodyStyle,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Palette.layer1,
            ),
          ),

          //fillColor: Palette.accentSecondary,
          //filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              width: 2,
              color: Palette.accentPrimary,
            ),
          ),
          //  focusColor: Palette.accentSecondary,
        ),
        //enabled: isEnable,
      ),
    );
  }
}
