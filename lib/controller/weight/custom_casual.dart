import 'package:assignment_test/controller/weight/landing_card.dart';
import 'package:assignment_test/model/Api_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.data,
  });

  final List<Show> data; // Change type to List<Show>

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var carouselOptions = CarouselOptions(
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      aspectRatio: 16 / 9,
      viewportFraction: 0.9,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    );

    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
        itemCount: data.length, // Change to data.length
        itemBuilder: (BuildContext context, int index, int realIndex) {
         final url = data[index].image ?? "fallback_image_url"; // Assuming you have an image field
          return GestureDetector(
            onTap: () {
              // Handle tap
            },
            child: LandingCard(
              image: CachedNetworkImageProvider(url ), // Update to use the URL from Show
              name: data[index].name ?? "Unknown", // Use Show name
            ),
          );
        },
        options: carouselOptions,
      ),
    );
  }
}
