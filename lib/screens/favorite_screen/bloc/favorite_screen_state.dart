part of 'favorite_screen_bloc.dart';

final class FavoriteScreenState extends Equatable {
  const FavoriteScreenState();
  // final List<FavoriteRepos> favoriteRepos;
  // const FavoriteScreenState({required this.favoriteRepos});

  @override
  List<Object> get props => [];
}

final class FavoriteScreenInitial extends FavoriteScreenState {
// const FavoriteScreenInitial ({required super.favoriteRepos});
}

final class FavoriteScreenLoading extends FavoriteScreenState {
 // const FavoriteScreenLoading({required super.favoriteRepos});

}

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

  // ToggleFavorite copyWith(bool? isFavorite) {
  //   return ToggleFavorite(isFavorite: isFavorite ?? this.isFavorite);
  // }

  @override
  List<Object> get props => [isFavorite];
}

final class FavoriteScreenFailure extends FavoriteScreenState {}
