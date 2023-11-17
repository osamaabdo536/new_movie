import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/addToWatchlistButton.dart';

import '../api/api_constants.dart';
import '../my_theme.dart';

class WatchListItem extends StatelessWidget {
  String? poster;
  String? title;
  String? releaseDate;
  double? voteAverage;
  WatchListItem(
      {required this.poster,
      required this.title,
      required this.releaseDate,
      required this.voteAverage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Stack(
              children: [
                Image.network(
                  "${APIConstants.imageUrl}$poster",
                  fit: BoxFit.fill,
                  width: 120,
                  height: 160,
                ),
                CustomButtonAdd()
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title!,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: MyTheme.whiteColor, fontSize: 14)),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: MyTheme.yellowColor,
                    size: 24.sp,
                  ),
                  Text('${voteAverage}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: MyTheme.yellowColor, fontSize: 14))
                ],
              ),
              Text(releaseDate!, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: MyTheme.gryColor, fontSize: 16))
            ],
          )
        ],
      ),
    );
  }
}
