//api서버로 호출해서 값을 받아오는 부분
//http 통신
import 'dart:convert';

import 'package:provider_simple_movie/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  //?api_key=08...
  var queryPram = {'api_key': '08ccced074a42646fb7a465de816472c'};

  // Future<List<Movie>?> loadMovies() async {
  //   var uri =
  //       Uri.https('api.themoviedb.org', '/3/movie/popular', queryPram);
  //   var response = await http.get(uri);
  //   if (response.body != null) {
  //     Map<String, dynamic> body = json.decode(response.body);
  //     if (body['results'] != null) {
  //       List<dynamic> list = body['results'];
  //       return list.map<Movie>((item) => Movie.fromJson(item)).toList();
  //     }
  //   }
  // }

  Future<List<Movie>> loadMovies() async {
    var uri = Uri.https('api.themoviedb.org', '/3/movie/popular', queryPram);
   //var response = await http.get(Uri.parse(uri));
    print(uri);

    var response = await http.get(uri);
    Map<String, dynamic> body = json.decode(response.body);
    List<dynamic> list = body['results'];
    return list.map<Movie>((item) => Movie.fromJson(item)).toList();
  }
}
