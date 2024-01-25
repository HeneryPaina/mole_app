import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/popular_movies/popular_movies_bloc.dart';
import '../bloc/popular_movies/popular_movies_state.dart';
import '../bloc/trending_movies/trending_movies_bloc.dart';
import '../bloc/trending_movies/trending_movies_state.dart';
import '../widgets/carousel_slider_widget.dart';
import 'movies_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
          child: Image.asset(
            'assets/img/logo.png',
            fit: BoxFit.contain,
            height: 60,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: 28,
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Trending",
                        style: TextStyle(
                            fontFamily: 'NotoSans', color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                       },
                      child: Text(
                        "Popular",
                        style: TextStyle(
                            fontFamily: 'NotoSans', color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                builder: (context, state) {
                  if (state is PopularMoviesLoaded) {
                    // Verifica se o estado é do tipo PopularMoviesLoaded
                    return CarouselWidget(movies: state.movies);
                  } else {
                    // Estado inicial, de carregamento ou de erro
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending",
                      style: TextStyle(
                          fontFamily: 'NotoSans', color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View all",
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            color: Colors.red,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
                builder: (context, state) {
                  if (state is TrendingMoviesLoading) {
                    return CircularProgressIndicator();
                  } else if (state is TrendingMoviesLoaded) {
                    return MoviesList(movies: state.movies);
                  } else if (state is TrendingMoviesError) {
                    return Text(state.message);
                  }
                  return Container();
                },
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25,left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: TextStyle(
                          fontFamily: 'NotoSans', color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View all",
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            color: Colors.red,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                builder: (context, state) {
                  if (state is PopularMoviesLoading) {
                    return CircularProgressIndicator();
                  } else if (state is PopularMoviesLoaded) {
                    return MoviesList(movies: state.movies);
                  } else if (state is PopularMoviesError) {
                    return Text(state.message);
                  }
                  return Container();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
