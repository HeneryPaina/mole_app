import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/Movie.dart';
import '../pages/movies_details_screen.dart';

class CarouselWidget extends StatelessWidget {
  final List<Movie> movies;

  CarouselWidget({required this.movies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
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
                Expanded(
                  child: Card(
                    color: Colors.black,
                    elevation: 2,
                    margin: const EdgeInsets.all(5),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SizedBox(
                      height: 300,
                      width: 200,
                      child: Ink.image(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w200/${movie.posterPath}'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 11, left: 28, right: 28),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Cor de fundo do botão
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(movie: movie),
                        ),
                      );
                    },
                    icon: Icon(
                      // <-- Icon
                      Icons.info_outline, color: Colors.white,
                      size: 24.0,
                    ),
                    label: Text(
                      'Details',
                      style:
                          TextStyle(color: Colors.white, fontFamily: 'NotoSans'),
                    ), // <-- Text
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
