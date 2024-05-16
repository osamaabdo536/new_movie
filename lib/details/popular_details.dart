import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import '../api/api_constants.dart';
import '../model/MoviesDetails.dart';
import '../my_theme.dart';
class PopularDetailsScreen extends StatefulWidget {
  static const String routeName = 'Details';

  @override
  State<PopularDetailsScreen> createState() => _PopularDetailsScreenState();
}

class _PopularDetailsScreenState extends State<PopularDetailsScreen> {

  ///MoviesDetails? popular;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MoviesDetails;

    return Scaffold(
      appBar: AppBar(
          actionsIconTheme: IconThemeData(color: MyTheme.yellowColor),
          title: Text(
            args.title!,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: MyTheme.yellowColor),
          ),
          backgroundColor: MyTheme.primaryLightColor,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)))),
      backgroundColor: MyTheme.primaryLightColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Image.network(
                    '${APIConstants.imageUrl}${args.posterPath}',
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        args.title!,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        args.releaseDate!,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: MyTheme.gryColor, fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Row(
                      children: [
                        Stack(children: [
                          Hero(
                              tag: 'img-${args.id}',
                              child: Image.network(
                                  "${APIConstants.imageUrl}${args.posterPath}")),
                        ]),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: MyTheme.yellowColor,
                                        size: 24.sp,
                                      ),
                                      Text(
                                        '${args.voteAverage}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: MyTheme.yellowColor,
                                                fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  ReadMoreText(
                                    args.overview ?? 'yfuj',
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    trimLines: 10,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            color: MyTheme.whiteColor,
                                            fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
