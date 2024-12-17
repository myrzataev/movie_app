import 'package:movie_app/data/data_source/search_movie_ds.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/repository/search_movie_repository.dart';

class SearchMovieRepositoryImpl implements SearchMovieRepository {
  SearchMovieDs searchMovieDs;
  SearchMovieRepositoryImpl({required this.searchMovieDs});
  @override
  Future<MovieModel> searchMovie({required String movieName}) async {
    return await searchMovieDs.searchMovie(movieName: movieName);
  }
}
