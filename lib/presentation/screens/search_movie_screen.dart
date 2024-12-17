import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/blocs/bloc/search_movie_bloc.dart';
import 'package:movie_app/presentation/screens/detailed_view_screen.dart';

class SearchMovieScreen extends StatefulWidget {
  const SearchMovieScreen({super.key});

  @override
  State<SearchMovieScreen> createState() => _SearchMovieScreenState();
}

class _SearchMovieScreenState extends State<SearchMovieScreen> {
  final TextEditingController _movieController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _movieController,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  fillColor: Color(0xff3A3F47),
                  filled: true,
                  hintText: "Search movie",
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
              onEditingComplete: () {
                BlocProvider.of<SearchMovieBloc>(context)
                    .add(SearchMovie(movieName: _movieController.text));
              },
            ),
            BlocBuilder<SearchMovieBloc, SearchMovieState>(
              builder: (context, state) {
                if (state is SearchMovieLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchMovieSuccess) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailedViewScreen(
                                    model: state.model,
                                  ))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            state.model.poster ??
                                "https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg",
                            height: 200,
                            width: 150,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.model.title ?? "",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      state.model.imdbRating ?? "",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.movie,
                                      color: Colors.white,
                                    ),
                                    Expanded(
                                      child: Text(
                                        state.model.genre ?? "",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      state.model.year ?? "",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.lock_clock,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      state.model.runtime ?? "",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else if (state is SearchMovieError) {
                  return Center(
                    child: Text(state.errorText),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
