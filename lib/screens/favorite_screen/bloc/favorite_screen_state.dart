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

  final bool isFavorite;

  const FavoriteScreenSuccess(
      {required this.favoriteRepos, this.isFavorite = true});

  // FavoriteScreenSuccess copyWith(
  //     List<FavoriteRepos>? favoriteRepos, bool? isFavorite) {
  //   return FavoriteScreenSuccess(
  //       favoriteRepos: favoriteRepos ?? this.favoriteRepos,
  //       isFavorite: isFavorite ?? this.isFavorite);

  @override
  List<Object> get props => [favoriteRepos, isFavorite];
}

final class ToggleFavorite extends FavoriteScreenState {
  final bool isFavorite;

  const ToggleFavorite({this.isFavorite = true});

  ToggleFavorite copyWith(bool? isFavorite) {
    return ToggleFavorite(isFavorite: isFavorite ?? this.isFavorite);
  }

  @override
  List<Object> get props => [isFavorite];
}

final class FavoriteScreenFailure extends FavoriteScreenState {}
