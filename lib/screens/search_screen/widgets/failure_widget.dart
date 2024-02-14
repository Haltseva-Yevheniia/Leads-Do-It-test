import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lead_do_it_test/screens/search_screen/widgets/search_screen_widgets.dart';

import '../../../constants.dart';
import '../../../style/style.dart';
import '../../../widgets/project_widgets.dart';

class SearchScreenFailureWidget extends StatelessWidget {
  const SearchScreenFailureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  trailing: SvgPicture.asset('asset/icons/Close.svg'),
                ),
              ),
              const Text(
                emptySearchResultHeader,
                textAlign: TextAlign.left,
                style: FontStyles.headerMainAccent,
              ),
            ],
          ),
        ),
        const Expanded(
            child: Center(
          child: Text(
            emptySearchResultBody,
            style: FontStyles.bodyPlaceHolder,
            textAlign: TextAlign.center,
          ),
        ))
      ],
    );
  }
}
