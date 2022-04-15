import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_movie/model/movie.dart';
import 'package:provider_simple_movie/provider/movie_provider.dart';

class MovieListWidget extends StatelessWidget {
  MovieListWidget({Key? key}) : super(key: key);
  late MovieProvider _movieProvider;

  Widget _makeMovieOne(Movie movie){
    return Row(
      children: [
        
      ],
    );
  }

  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _makeMovieOne(movies[index]);
            //Center(child: Text(movies[index].title.toString()),
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: movies.length);
  }

  @override
  Widget build(BuildContext context) {
    //consumer에서 업데이트가 되는거지, 전체가 업데이트가 될 필요없기 때문에 listen:false
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.loadMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text('movie Provider'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, widget) {
          if (provider.movies != null && provider.movies.length > 0) {
            return _makeListView(provider.movies);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
