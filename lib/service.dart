import 'dart:convert';

import 'package:flutter_bloc2/model.dart';
import 'package:http/http.dart' as http;

class ServiceMovie {
  Future<MovieModel?> getMovie() async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/movie/top_rated?api_key=4c65dcd30f0b84629a0af3d4802ab464&language=en-US&page=1"),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);

        var result = MovieModel.fromJson(decodedData);
        return result;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}
