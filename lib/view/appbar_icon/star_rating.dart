import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:par_1/utils/colors.dart';

class StarRating extends StatefulWidget {
  const StarRating({super.key});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  double currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RatingBar.builder(
          initialRating: 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 30,
          itemBuilder: (context, _) => Icon(Icons.star, color: txtColor),
          onRatingUpdate: (rating) {
            setState(() {
              currentRating = rating;
            });
          },
        ),
        // Text(
        //   'Rating: ${currentRating.toStringAsFixed(1)} ',
        //   style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        // ),
      ],
    );
  }
}
