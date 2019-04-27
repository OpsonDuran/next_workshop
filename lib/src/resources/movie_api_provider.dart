import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/item_model.dart';
import '../models/trailer_model.dart';


class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'e05012a4f6646a86ab26f517863bad65';
  final _baseUrl = "http://api.themoviedb.org/3/movie";
  
  Future<ItemModel> fetchMovieList() async{
    print("entered");
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if(response.statusCode==200){
      return ItemModel.fromJson(jsonDecode(response.body));
    }else {
      throw Exception('Failed to load');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async{
    final response = await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");
    if(response.statusCode==200){
      return TrailerModel.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load tarilers');
    }
  }
}
