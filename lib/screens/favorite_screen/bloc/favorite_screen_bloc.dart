import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_do_it_test/local_data_base/favorite_repos_model.dart';

import '../../../local_data_base/data_base_service.dart';

part 'favorite_screen_event.dart';
part 'favorite_screen_state.dart';

class FavoriteScreenBloc
    extends Bloc<FavoriteScreenEvent, FavoriteScreenState> {
  final _localFavoriteDataBase = DataBaseService.instance;

  FavoriteScreenBloc() : super(FavoriteScreenInitial()) {
    on<FetchFavoriteRepos>(_onFetchedFavoriteRepos);
    on<ToggleFavoriteRepos>(_onToggleFavoriteRepos);
  }

  Future<void> _onFetchedFavoriteRepos(
      FetchFavoriteRepos event, Emitter<FavoriteScreenState> emit) async {
    emit(FavoriteScreenLoading());
    try {
      final fetchFavouriteRepos =
          await _localFavoriteDataBase.fetchFavoriteRepos();
      emit(FavoriteScreenSuccess(favoriteRepos: fetchFavouriteRepos));
    } catch (_) {
      emit(FavoriteScreenFailure());
    }
  }

  Future<void> _onToggleFavoriteRepos(
      ToggleFavoriteRepos event, Emitter<FavoriteScreenState> emit) async {
    emit(FavoriteScreenLoading());
    await _localFavoriteDataBase.removeRepos(event.id);
    final fetchFavouriteRepos =
        await _localFavoriteDataBase.fetchFavoriteRepos();
    emit(FavoriteScreenSuccess(favoriteRepos: fetchFavouriteRepos));
  }
}
