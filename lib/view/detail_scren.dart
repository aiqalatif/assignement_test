import 'package:assignment_test/view/weight/utiles.dart';
import 'package:assignment_test/model/Api_model.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  final int movieId;
  final String image;
  final String summery;
  final String name;
  final String officialSite;
  final List<String> genres;
  final int? runtime;
  final Rating rating;

  const MovieDetailScreen({
    super.key,
    required this.movieId,
    required this.image,
    required this.summery,
    required this.name,
    required this.officialSite,
    required this.genres,
    required this.runtime,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movie Detail Screen",
          style: TextStylePro.h2Style(),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
                image: DecorationImage(
                  image: image.isNotEmpty ? NetworkImage(image) : const AssetImage('assets/placeholder.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStylePro.h3Style(),
                  ),
                const  SizedBox(height: 8),
                  Text(
                    "Genres: ${genres.join(', ')}",
                    style: TextStylePro.bodyStyle(),
                  ),
                 const SizedBox(height: 8),
                  Text(
                    runtime != null ? "Runtime: ${runtime} min" : "Runtime: N/A",
                    style: TextStylePro.bodyStyle(),
                  ),
                const  SizedBox(height: 8),
                  Text(
                    "Rating: ${rating.average}/10",
                    style: TextStylePro.bodyStyle(),),
                  
                const  SizedBox(height: 16),
                  Text(
                    "Summary",
                    style: TextStylePro.h3Style(),
                  ),
               const   SizedBox(height: 8),
                  Text(
                    summery,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStylePro.bodyStyle(),
                  ),
                  // SizedBox(height: 16),
                  // if (officialSite != null && officialSite.isNotEmpty)
                  //   ElevatedButton(
                  //     onPressed: () {
                  //       // Navigate to the official site or show a dialog
                  //     },
                  //     child:const Text('Visit Official Site'),
                  //     style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
