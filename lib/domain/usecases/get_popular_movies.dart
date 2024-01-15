import 'package:movie_app/domain/repositories/movie_repository.dart';

import '../entities/Movie.dart';

class GetPopularMovies{
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future <List<Movie>>call() async{
    return await repository.getPopularMovies();
  }
}