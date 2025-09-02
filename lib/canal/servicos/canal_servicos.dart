import 'dart:convert';
import 'package:app_canal/canal/model/canal_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://rottentomato.p.rapidapi.com/streaming-tv";
  static const String apiKey =
      "d15ea6aeb1msheca15420f30fd24p1edd09jsnc96b0e1e324b";
  static const String apiHost = "rottentomato.p.rapidapi.com";

  static Future<List<CanalModel>> fetchShows({
    String genre = "action",
    String sortBy = "critic_highest",
    String after = "Mjk%3D",
  }) async {
    final uri = Uri.parse("$baseUrl?genre=$genre&sortby=$sortBy&after=$after");

    final response = await http.get(
      uri,
      headers: {'X-RapidAPI-Key': apiKey, 'X-RapidAPI-Host': apiHost},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List showsJson = data['shows'];
      return showsJson.map((json) => CanalModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar shows: ${response.statusCode}');
    }
  }
}
