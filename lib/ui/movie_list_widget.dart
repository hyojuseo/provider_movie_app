import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_movie/provider/movie_provider.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('movie Provider'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, widget) {
          if (provider.movies != null && provider.movies.length > 0) {}
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
