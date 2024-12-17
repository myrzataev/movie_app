part of 'search_movie_bloc.dart';

@immutable
sealed class SearchMovieState {}

final class SearchMovieInitial extends SearchMovieState {}

final class SearchMovieLoading extends SearchMovieState {}

final class SearchMovieSuccess extends SearchMovieState {
  final MovieModel model;
  SearchMovieSuccess({required this.model});
}

final class SearchMovieError extends SearchMovieState {
  final String errorText;
  SearchMovieError({required this.errorText});
}
