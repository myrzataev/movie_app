import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/data/data_source/search_movie_ds.dart';
import 'package:movie_app/data/repository/search_movie_repository_impl.dart';
import 'package:movie_app/presentation/blocs/bloc/search_movie_bloc.dart';
import 'package:movie_app/presentation/screens/search_movie_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => SearchMovieDs(),
        ),
        RepositoryProvider(
            create: (context) => SearchMovieRepositoryImpl(
                searchMovieDs: RepositoryProvider.of<SearchMovieDs>(context)))
      ],
      child: BlocProvider(
        create: (context) => SearchMovieBloc(
            searchMovieRepositoryImpl:
                RepositoryProvider.of<SearchMovieRepositoryImpl>(context)),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                scaffoldBackgroundColor: const Color(0xfff242A32),
                appBarTheme:
                    const AppBarTheme(backgroundColor: Color(0xfff242A32))),
            home: const SearchMovieScreen()),
      ),
    );
  }
}
