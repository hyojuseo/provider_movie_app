//이미지(poster_path), 제목(title), 설명(overview)
class Movie{
  String? overview;
  String? poster_path;
  String? title;

  Movie({this.overview, this.poster_path, this.title});

  //factory json 기법
  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      overview: json['overview'] == null ? '' : json['overview'] as String,
      poster_path: json['poster_path'] == null ? '' : json['poster_path'] as String,
      title: json['title'] == null ? '' : json['title'] as String,
    );
  }
}