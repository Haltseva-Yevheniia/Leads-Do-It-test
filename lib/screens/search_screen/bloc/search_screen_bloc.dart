import 'dart:async';

//import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_do_it_test/local_search_history/local_search_history.dart';
import 'package:lead_do_it_test/models/repository_model.dart';
import 'package:lead_do_it_test/service_api/service_api.dart';

import '../../../local_data_base/data_base_service.dart';

part 'search_screen_event.dart';
part 'search_screen_state.dart';

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  final ServiceApi serviceApi = ServiceApi();
  final _localFavoriteDataBase = DataBaseService.instance;
  final localSearchHistory = LocalSearchHistory();

  SearchScreenBloc() : super(SearchScreenInitialState()) {
    on<SearchScreenInitialEvent>(_onGetHistory);
    //on<StartSearchEvent>(_onReadySearch);
    on<FetchReposEvent>(_onFetchedRepos);
    on<ToggleFavoriteRepos>(_onToggleFavoriteRepos);
  }

  Future<void> _onGetHistory(
      SearchScreenInitialEvent event, Emitter<SearchScreenState> emit) async {
    emit(SearchScreenLoadingState());
    await localSearchHistory.getHistory();
    localSearchHistory.searchHistory.isNotEmpty
        ? emit(GotHistoryState(
            searchHistory: localSearchHistory.searchHistory,
            isHistoryEmpty: false))
        : emit(const GotHistoryState());
  }

  Future<void> _onFetchedRepos(
      FetchReposEvent event, Emitter<SearchScreenState> emit) async {
    if (state ==  SearchScreenInitialState) {


    emit(SearchScreenLoadingState());
    try {
      localSearchHistory.addHistory(event.name);
      localSearchHistory.saveHistory();
      List<RepositoryModel> repositories =
          await serviceApi.fetchRepositories(name: event.name, page: event.page, );
      final favouriteRepos = await _localFavoriteDataBase.fetchFavoriteRepos();
      List<int> currentListId = repositories.map((repos) => repos.id).toList();
      List<int?> favoriteListId =
          favouriteRepos.map((favRepos) => favRepos.id).toList();
      List<int> favoritesFromCurrentListId =
          currentListId.where((id) => favoriteListId.contains(id)).toList();
      emit(FetchReposSuccessState(
          favoritesFromCurrentListId: favoritesFromCurrentListId,
          repositories: repositories));
    } catch (_) {
      emit(SearchScreenFailure());
    }
  }  else if (state == FetchReposSuccessState) {
      emit(SearchScreenLoadingState());
      try {
        int nextPage = event.page!~/30+1;
        localSearchHistory.addHistory(event.name);
        localSearchHistory.saveHistory();
        List<RepositoryModel> repositories =
        await serviceApi.fetchRepositories(name: event.name, page: nextPage, );
        final favouriteRepos = await _localFavoriteDataBase.fetchFavoriteRepos();
        List<int> currentListId = repositories.map((repos) => repos.id).toList();
        List<int?> favoriteListId =
        favouriteRepos.map((favRepos) => favRepos.id).toList();
        List<int> favoritesFromCurrentListId =
        currentListId.where((id) => favoriteListId.contains(id)).toList();
        emit(FetchReposSuccessState(
            favoritesFromCurrentListId: favoritesFromCurrentListId,
            repositories: repositories));
      } catch (_) {
        emit(SearchScreenFailure());
      }
  }}

  Future<void> _onToggleFavoriteRepos(
      ToggleFavoriteRepos event, Emitter<SearchScreenState> emit) async {
    emit(SearchScreenLoadingState());

    final isFavourite = await _localFavoriteDataBase.isReposFavorite(event.id);

    if (isFavourite) {
      await _localFavoriteDataBase.removeRepos(event.id);
      final favouriteRepos = await _localFavoriteDataBase.fetchFavoriteRepos();
      List<int?> favoriteListId =
          favouriteRepos.map((favRepos) => favRepos.id).toList();
      List<int> currentListId =
          event.repositories.map((repos) => repos.id).toList();
      List<int> favoritesFromCurrentListId =
          currentListId.where((id) => favoriteListId.contains(id)).toList();

      emit(ToggleSearchCardState(
          favoritesFromCurrentListId: favoritesFromCurrentListId,
          repositories: event.repositories));
    } else {
      await _localFavoriteDataBase.addFavoriteRepos(
          id: event.id, name: event.name);
      final favouriteRepos = await _localFavoriteDataBase.fetchFavoriteRepos();
      List<int?> favoriteListId =
          favouriteRepos.map((favRepos) => favRepos.id).toList();
      List<int> currentListId =
          event.repositories.map((repos) => repos.id).toList();
      List<int> favoritesFromCurrentListId =
          currentListId.where((id) => favoriteListId.contains(id)).toList();

      emit(ToggleSearchCardState(
          favoritesFromCurrentListId: favoritesFromCurrentListId,
          repositories: event.repositories));
    }
  }
}
