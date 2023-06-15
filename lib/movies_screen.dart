import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login/models/Movie_item.dart';
import 'package:http/http.dart' as http;

class MyMovies extends StatefulWidget {
  const MyMovies({super.key});

  @override
  State<MyMovies> createState() => MyMoviesState();
}

class MyMoviesState extends State<MyMovies> {
  List<Result> movies = [];

  Future<List<Result>> fetchMovies() async {
    const String apiKey = '2b050e170697c74b36ea255ffb37073c';
    const url = 'https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}';

    final response = await http.get(Uri.parse(url));

    print(response.statusCode);
    if (response.statusCode == 200) {
      final Movies movies = moviesFromJson(response.body);
      final List<Result>? moviesResult = movies.results;
      return moviesResult != null ? moviesResult : [];
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMovies().then((data) {
      setState(() {
        print(data);
        movies = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          final posterUrl =
              'https://image.tmdb.org/t/p/w200${movie.posterPath}';
          final title = movie.title;
          final overview = movie.overview;

          return ListTile(
            leading: Image.network(posterUrl),
            title: Text(title),
            subtitle: Text(
              overview,
            ),
          );
        },
      ),
    );
  }
}
