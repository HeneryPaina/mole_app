import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/Movie.dart';

class MovieCard extends StatelessWidget {
  MovieCard(this.movie, {super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      elevation: 2,
      margin: const EdgeInsets.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 130,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 130,
              child: Ink.image(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: Text(
                movie.title,
                maxLines: 2,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'NotoSans',
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
