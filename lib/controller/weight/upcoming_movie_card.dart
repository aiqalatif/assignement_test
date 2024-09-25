import 'package:assignment_test/view/detail_scren.dart';
import 'package:flutter/material.dart';
import 'package:assignment_test/model/Api_model.dart'; // Ensure your model has the necessary data structure

class UpcomingMovieCard extends StatelessWidget {
  final List<Show> data; // Assuming `Show` is a list of movie objects
  final String headlineText;

  const UpcomingMovieCard({
    super.key,
    required this.headlineText,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headlineText,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20), // Style for the header
          ),
          const SizedBox(height: 20),
          
          // Wrapping ListView.builder in Flexible to prevent overflow
          Flexible(
            child: SizedBox(
              height: 220, // Set a fixed height for the movie card
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: data.length, // Use length of the list
                itemBuilder: (context, index) {
                  // Fetch each movie's data
                  final movie = data[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: () {
                         
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(
                          movieId: movie.id, 
                          image:movie.image!,
                          summery:movie.summary,
                          name:movie.name, 
                          officialSite: '',
                           genres: movie.genres,
                            runtime: movie.runtime,
                             rating: movie.rating,


                          // Pass the movie ID
                        ),
                      ),
                    );
                      },
                      child: Container(
                        width: 150, // Set width for each movie card
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              '${movie.image}', // Access poster path from movie object
                            ),
                            fit: BoxFit.cover, // Cover the entire container
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
