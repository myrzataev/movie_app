import 'package:movie_app/data/models/movie_model.dart';

abstract interface class SearchMovieRepository {
  Future<MovieModel> searchMovie({required String movieName});
}