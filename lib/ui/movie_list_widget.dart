import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_movie/model/movie.dart';
import 'package:provider_simple_movie/provider/movie_provider.dart';

class MovieListWidget extends StatelessWidget {
  MovieListWidget({Key? key}) : super(key: key);
  late MovieProvider _movieProvider;

  Widget _makeMovieOne(Movie movie) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          child: Image.network(
            movie.postUri,
            height: 200,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  movie.title!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  movie.overview!,
                  overflow: TextOverflow.ellipsis, //10줄을 넘어가면 ...으로 표시
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                  maxLines: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: _makeMovieOne(movies[index]),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
          );
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
