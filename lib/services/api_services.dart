import 'dart:convert';
import 'package:assignment_test/model/Api_model.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  final String _baseUrl = 'https://api.tvmaze.com/search/shows?q=';

  // Fetch all movies
  Future<List<Show>> fetchMovies() async {
    return await _fetchMoviesByQuery('all'); // Default fetch for all movies
  }

  // Fetch movies by search term
  Future<List<Show>> searchMovies(String searchTerm) async {
    return await _fetchMoviesByQuery(searchTerm);
  }

  // Private method to handle API requests
  Future<List<Show>> _fetchMoviesByQuery(String query) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl$query')); // Construct the URL with the query

      if (response.statusCode == 200) {
        final List moviesJson = json.decode(response.body); // Decode the response body
        print(response.body);

        // Map the DriverData to Show directly
        return moviesJson.map<Show>((movie) => DriverData.fromJson(movie).show).toList();
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
