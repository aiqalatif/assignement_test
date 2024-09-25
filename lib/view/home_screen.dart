import 'package:assignment_test/controller/provider.dart';
import 'package:assignment_test/controller/weight/coming_soon_movie.dart';
import 'package:assignment_test/controller/weight/custom_app_bar.dart';
import 'package:assignment_test/controller/weight/custom_casual.dart';
import 'package:assignment_test/controller/weight/upcoming_movie_card.dart';
import 'package:assignment_test/model/Api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesAsyncValue = ref.watch(movieListProvider);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Handle the state of the movies (loading, error, data) only once
            moviesAsyncValue.when(
              data: (movies) {
                return Column(
                  children: [
                    CustomCarouselSlider(data: movies), // Carousel with movies
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: UpcomingMovieCard(data: movies, headlineText: 'Now Playing'),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 220,
                      child: UpcomingMovieCard(data: movies, headlineText: 'Upcoming Movies'),
                    ),
                  ],
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(), // Show a single loading indicator in the center
              ),
              error: (error, stack) => Center(
                child: Text('Error: $error'), // Display error message
              ),
            ),
          ],
        ),
      ),
    );
  }
}
