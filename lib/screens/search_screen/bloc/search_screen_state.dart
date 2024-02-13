part of 'search_screen_bloc.dart';

enum SearchScreenStatus {initial,initialHistory, loading, success, failure}

final class SearchScreenState extends Equatable {

  final SearchScreenStatus status;
  final List<RepositoryModel> repositories;
  final List <String> searchHistory;
  final bool isFavoriteRepos;
final bool isHistoryEmpty;
  const SearchScreenState({
    this.status = SearchScreenStatus.initial,
    this.repositories = const <RepositoryModel> [],
    this.searchHistory = const <String> [],
  this.isFavoriteRepos = false,
  this.isHistoryEmpty = true,
});

  SearchScreenState copyWith ({
    SearchScreenStatus? status,
    List<RepositoryModel>? repositories,
    List<String>? searchHistory,
    bool? isFavoriteRepos,
    bool? isHistoryEmpty,
  }) {
    return SearchScreenState(
      status: status ?? this.status,
      repositories: repositories ?? this.repositories,
      searchHistory: searchHistory ?? this.searchHistory,
      isFavoriteRepos: isFavoriteRepos ?? this.isFavoriteRepos,
      isHistoryEmpty: isHistoryEmpty ?? this.isHistoryEmpty,
    );
  }

  @override
  List<Object?> get props => [status, repositories, searchHistory, isFavoriteRepos, isHistoryEmpty];

  @override
  String toString () {
    return 'SearchScreenState: {repositoriesLength: ${repositories.length}, Status: $status, isFavoriteRepos: $isFavoriteRepos  }';
  }
}
