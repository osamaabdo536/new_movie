import 'package:flutter/material.dart';
import '../../../my_theme.dart';
import '../../api/api_constants.dart';
import '../../model/MoviesDetails.dart';

class ItemMovies extends StatelessWidget {
  MoviesDetails movies;
  ItemMovies({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          "${APIConstants.imageUrl}${movies.posterPath ?? ''}",
          width: double.infinity,
          height: 350,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 6),
        Text(
          movies.title ?? '',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: MyTheme.whiteColor,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: MyTheme.yellowColor,
              size: 19,
            ),
            Text(
              movies.voteAverage.toString()??'',
              style: TextStyle(
                  color: MyTheme.yellowColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 210,
              height: 45,
            ),
            Text(
              movies.originalLanguage ?? '',
              style: TextStyle(
                color: MyTheme.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Text(
          movies.releaseDate ?? "",
          style: TextStyle(
              color: MyTheme.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        Divider(
          color: MyTheme.yellowColor,
          thickness: 1,
        ),
      ],
    );
  }
}
