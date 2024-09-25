// providers.dart
import 'package:assignment_test/model/Api_model.dart';
import 'package:assignment_test/services/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Movie repository provider
final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepository();
});

// Future provider for fetching movies
final movieListProvider = FutureProvider<List<Show>>((ref) async {
  final repository = ref.read(movieRepositoryProvider);
  
  // Fetch the movies and return the list of shows directly from the ShowsResponse
  final showsResponse = await repository.fetchMovies();
  
  return showsResponse; // Return the list of shows
});
