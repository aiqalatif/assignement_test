import 'dart:async';
import 'package:flutter/material.dart';
import 'package:assignment_test/model/Api_model.dart'; // Import your Show model
import 'package:assignment_test/services/api_services.dart'; // Import the MovieRepository

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final MovieRepository _movieRepository = MovieRepository();
  List<Show> _searchResults = [];
  bool _isLoading = false;

  Future<void> _searchMovies(String searchTerm) async {
    if (searchTerm.isEmpty) {
      setState(() {
        _searchResults = []; // Clear results if the search term is empty
      });
      return;
    }

    setState(() {
      _isLoading = true; // Start loading
    });

    try {
      final results = await _movieRepository.searchMovies(searchTerm);
      setState(() {
        _searchResults = results;
      });
    } catch (e) {
      print(e);
      // Handle error (e.g., show a snackbar)
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Failed to load movies: $e')),
      // );
    } finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Search Movies'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => _searchMovies(value), // Trigger search on text change
              decoration: InputDecoration(
                hintText: 'Search for a movie...',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear(); // Clear the search field
                    _searchMovies(''); // Clear the results
                  },
                ),
              ),
            ),
          ),
          if (_isLoading) // Show loading indicator while fetching
            const Center(child: CircularProgressIndicator()),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final show = _searchResults[index];
                return ListTile(
                  title: Text(show.name ?? 'No Name'), // Null check for name
                  subtitle: Text(show.summary ?? 'No Summary'), // Null check for summary
                  // leading: show.image != null && show.image!.isNotEmpty
                  //     // ? Image.network(show.image!) // Use image if available
                  //      const Icon(Icons.movie), // Default icon if no image
                  onTap: () {
                    // Navigate to movie detail screen (implement this as needed)
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
