part of 'search_screen_bloc.dart';

sealed class SearchScreenEvent extends Equatable {
  const SearchScreenEvent();

  @override
  List<Object?> get props => [];
}

final class SearchScreenInitialEvent extends SearchScreenEvent {}

// final class StartSearchEvent extends SearchScreenEvent{}

final class FetchReposEvent extends SearchScreenEvent {
  final String name;
  final int? page;

  const FetchReposEvent({required this.name, this.page});
}

final class ToggleFavoriteRepos extends SearchScreenEvent {
  final int id;
  final String name;
  final List<RepositoryModel> repositories;

  const ToggleFavoriteRepos(
      {required this.id, required this.name, required this.repositories});
}
