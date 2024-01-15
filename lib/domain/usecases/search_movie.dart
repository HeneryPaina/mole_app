import 'package:movie_app/domain/repositories/movie_repository.dart';

import '../entities/Movie.dart';

class SearchMovie{
  final MovieRepository repository;

  SearchMovie(this.repository);

  Future <List<Movie>>call(String query) async{
    return await repository.searchMovies(query);
  }
}