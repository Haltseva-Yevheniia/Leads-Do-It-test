import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_do_it_test/screens/loading_screen/view/loading_screen_view.dart';
import 'package:lead_do_it_test/service_api/service_api.dart';

import 'local_data_base/data_base_service.dart';
import 'movie_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseService.instance.init();
  Bloc.observer = MovieObserver();
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  final ServiceApi serviceApi = ServiceApi();

  TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreenView(),
    );
  }
}
