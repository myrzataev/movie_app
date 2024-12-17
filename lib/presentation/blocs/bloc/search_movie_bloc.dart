import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/repository/search_movie_repository_impl.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  SearchMovieRepositoryImpl searchMovieRepositoryImpl;
  SearchMovieBloc({required this.searchMovieRepositoryImpl})
      : super(SearchMovieInitial()) {
    on<SearchMovie>((event, emit) async {
      try {
        emit(SearchMovieLoading());
        final result = await searchMovieRepositoryImpl.searchMovie(
            movieName: event.movieName);
        emit(SearchMovieSuccess(model: result));
      } catch (e) {
        emit(SearchMovieError(errorText: e.toString()));
      }
    });
  }
}
