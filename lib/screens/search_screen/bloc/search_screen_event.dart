part of 'search_screen_bloc.dart';

sealed class SearchScreenEvent extends Equatable {
  const SearchScreenEvent();

  @override
  List<Object?> get props => [];
}

final class SearchScreenInitialEvent extends SearchScreenEvent {}

final class ReposFetchedEvent extends SearchScreenEvent {
  final String name;

  const ReposFetchedEvent({required this.name});
}

final class ToggleFavoriteRepos extends SearchScreenEvent {
  final int id;
  final String name;

  const ToggleFavoriteRepos({required this.id, required this.name});
}
