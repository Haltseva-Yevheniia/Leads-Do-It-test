import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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

  SearchScreenBloc() : super(const SearchScreenState()) {
    on<SearchScreenInitialEvent>(_onGetHistory);
    on<ReposFetchedEvent>(_onFetchedRepos);
    on<ToggleFavoriteRepos>(_onToggleFavoriteRepos);
  }

  Future<void> _onGetHistory(
      SearchScreenInitialEvent event, Emitter<SearchScreenState> emit) async {
    //emit(state.copyWith(status: SearchScreenStatus.loading));
    await localSearchHistory.getHistory();
    localSearchHistory.searchHistory.isNotEmpty
        ? emit(state.copyWith(
            status: SearchScreenStatus.initialHistory,
            isHistoryEmpty: false,
            searchHistory: localSearchHistory.searchHistory))
        : emit(state.copyWith(status: SearchScreenStatus.initialHistory));
  }

  Future<void> _onFetchedRepos(
      ReposFetchedEvent event, Emitter<SearchScreenState> emit) async {
    emit(state.copyWith(status: SearchScreenStatus.loading));
    try {
      localSearchHistory.addHistory(event.name);
      localSearchHistory.saveHistory();
      List<RepositoryModel> repositories =
          await serviceApi.fetchRepositories(name: event.name);
      emit(state.copyWith(
        status: SearchScreenStatus.success,
        repositories: repositories,
        isHistoryEmpty: false,
        searchHistory: localSearchHistory.searchHistory,
      ));
    } catch (_) {
      emit(state.copyWith(status: SearchScreenStatus.failure));
    }
  }

  Future<void> _onToggleFavoriteRepos(
      ToggleFavoriteRepos event, Emitter<SearchScreenState> emit) async {
    final isFavourite = await _localFavoriteDataBase.isReposFavorite(event.id);
    if (isFavourite) {
      await _localFavoriteDataBase.removeRepos(event.id);
      emit(state.copyWith(isFavoriteRepos: false));
    } else {
      // await _localFavoriteDataBase.addFavoriteRepos(
      //     state.repositories.is);
      emit(state.copyWith(isFavoriteRepos: true));
    }
  }
}
