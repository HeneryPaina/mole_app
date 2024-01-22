import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/Movie.dart';

class CarouselWidget extends StatelessWidget {
  final List<Movie> movies;

  CarouselWidget({required this.movies});

  @override
  Widget build(BuildContext context) {
    //final List<Movie> moviesToDisplay = movies.take(10).toList();
    return CarouselSlider(
      options: CarouselOptions(
        height: 456.5,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
      items: movies.map((movie) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              children: [
                Card(
                  elevation: 2,
                  margin: const EdgeInsets.all(5),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: SizedBox(
                    height: 350,
                    width: 280,
                    child: Ink.image(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w200/${movie.posterPath}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
