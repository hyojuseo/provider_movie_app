import 'package:flutter/material.dart';
import 'package:provider_simple_movie/model/movie.dart';
import 'package:provider_simple_movie/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier{
  MovieRepository _movieRepository = MovieRepository();
  List<Movie> _movies = [];
  //외부에서 접근가능한것도 추가
  List<Movie> get movies => _movies;

  loadMovies() async {
    //repository에 접근해서 불러오기
    List<Movie> listMovies = await _movieRepository.loadMovies();
    //listMovies에서 예외처리해주고 추가적인 가공처리를 해줘야함.
    _movies = listMovies;
    notifyListeners();
  }
}