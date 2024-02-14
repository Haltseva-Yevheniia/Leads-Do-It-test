part of 'favorite_screen_bloc.dart';

final class FavoriteScreenState extends Equatable {
  const FavoriteScreenState();

  @override
  List<Object> get props => [];
}

final class FavoriteScreenInitial extends FavoriteScreenState {}

final class FavoriteScreenLoading extends FavoriteScreenState {}

final class FavoriteScreenSuccess extends FavoriteScreenState {
  final List<FavoriteRepos> favoriteRepos;

  const FavoriteScreenSuccess({required this.favoriteRepos});

  @override
  List<Object> get props => [favoriteRepos];
}

final class ToggleFavorite extends FavoriteScreenState {
  final bool isFavorite;
  final List<FavoriteRepos> favoriteRepos;

  const ToggleFavorite({this.isFavorite = true, required this.favoriteRepos});

  @override
  List<Object> get props => [isFavorite];
}

final class FavoriteScreenFailure extends FavoriteScreenState {}
