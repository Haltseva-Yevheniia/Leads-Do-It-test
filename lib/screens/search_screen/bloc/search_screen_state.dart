part of 'search_screen_bloc.dart';

final class SearchScreenState extends Equatable {
  const SearchScreenState();

  @override
  List<Object?> get props => [];
}

final class SearchScreenInitialState extends SearchScreenState {}

final class SearchScreenLoadingState extends SearchScreenState {}

final class GotHistoryState extends SearchScreenState {
  final List<String> searchHistory;
  final bool isHistoryEmpty;

  const GotHistoryState({
    this.searchHistory = const <String>[],
    this.isHistoryEmpty = true,
  });

  @override
  List<Object?> get prop => [searchHistory, isHistoryEmpty];

  @override
  String toString() {
    return 'GotHistoryState: {searchHistory: ${searchHistory.length}, isHistoryEmpty: $isHistoryEmpty  }';
  }
}

final class ReadySearchState extends SearchScreenState {}

final class FetchReposSuccessState extends SearchScreenState {
  final List<RepositoryModel> repositories;
  //final List<int?> favoriteListId;
  final List<int> favoritesFromCurrentListId;

  const FetchReposSuccessState({
    this.repositories = const <RepositoryModel>[],
    this.favoritesFromCurrentListId = const <int>[],
   // this.favoriteListId = const <int>[],
  });

  @override
  List<Object?> get prop =>
      [repositories, favoritesFromCurrentListId];

  @override
  String toString() {
    return 'FetchReposSuccessState: {repositories: ${repositories.length},favoritesFromCurrentListId: $favoritesFromCurrentListId  }';
  }
}

final class ToggleSearchCardState extends SearchScreenState {
    final List<RepositoryModel> repositories;
  final List<int> favoritesFromCurrentListId;

  const ToggleSearchCardState({

    this.repositories = const <RepositoryModel>[],
    this.favoritesFromCurrentListId = const <int>[],

  });

  @override
  List<Object?> get prop => [repositories,favoritesFromCurrentListId];

  // @override
  // String toString() {
  //   return 'ToggleSearchCardState:{ isFavorite: $isFavorite  }';
  // }
}

final class SearchScreenFailure extends SearchScreenState {}
