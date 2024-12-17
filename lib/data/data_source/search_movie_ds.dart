import 'package:dio/dio.dart';
import 'package:movie_app/data/models/movie_model.dart';

class SearchMovieDs {
  final Dio dio = Dio();
  Future<MovieModel> searchMovie({required String movieName}) async {
    final Response response = await dio.get("http://www.omdbapi.com/",
        queryParameters: {"apikey": "5495bffa", "t": movieName});
    return MovieModel.fromMap(response.data);
  }
}
