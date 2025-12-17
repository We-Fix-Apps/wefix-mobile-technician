import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WidgetRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final double size;

  const WidgetRating({super.key, this.starCount = 5, this.rating = 1.5, this.size = 30.0});

  @override
  State<WidgetRating> createState() => _WidgetRatingState();
}

class _WidgetRatingState extends State<WidgetRating> {
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: widget.rating,
      itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber, size: 10),
      itemCount: 5,
      itemSize: 25.0,
      direction: Axis.horizontal,
    );
  }
}
