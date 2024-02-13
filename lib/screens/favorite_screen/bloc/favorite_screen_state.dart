part of 'favorite_screen_bloc.dart';

final class FavoriteScreenState extends Equatable {
  const FavoriteScreenState();
  @override
  List<Object> get props => [];
}

final class FavoriteScreenInitial extends FavoriteScreenState {

}


final class FavoriteScreenLoading extends FavoriteScreenState {}

final class FavoriteScreenSuccess extends FavoriteScreenState {
  final List<RepositoryModel> favoriteRepos;
  final bool isFavorite;
  const FavoriteScreenSuccess({required this.favoriteRepos, this.isFavorite=true});
  @override
  List<Object> get props => [favoriteRepos, isFavorite];
}

final class ToggleFavorite extends FavoriteScreenState {
  final bool isFavorite;
  const ToggleFavorite ({this.isFavorite = true});
  @override
  List<Object> get props => [isFavorite];
}

final class FavoriteScreenFailure extends FavoriteScreenState {

}