part of 'favorite_screen_bloc.dart';

sealed class FavoriteScreenEvent extends Equatable {
  const FavoriteScreenEvent();

  @override
  List<Object?> get props => [];
}

final class FetchFavoriteRepos extends FavoriteScreenEvent {}

final class ToggleFavoriteRepos extends FavoriteScreenEvent {
  final int id;
  final String name;

  const ToggleFavoriteRepos({required this.id, required this.name});
}
