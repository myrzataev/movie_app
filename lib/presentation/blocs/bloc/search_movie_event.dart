part of 'search_movie_bloc.dart';

@immutable
sealed class SearchMovieEvent {}

class SearchMovie extends SearchMovieEvent {
  final String movieName;
  SearchMovie({required this.movieName});
}
