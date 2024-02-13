import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lead_do_it_test/models/repository_model.dart';

part 'favorite_screen_event.dart';
part 'favorite_screen_state.dart';

class FavoriteScreenBloc
    extends Bloc<FavoriteScreenEvent, FavoriteScreenState> {
  FavoriteScreenBloc() : super(FavoriteScreenInitial()) {
    on<FavoriteScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
