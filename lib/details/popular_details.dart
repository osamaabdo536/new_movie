import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/my_theme.dart';
import '../api/api_constants.dart';
import '../model/MoviesDetails.dart';

class PopularDetailsScreen extends StatelessWidget {
  static const String routeName = 'Details';

  ///MoviesDetails? popular;

  @override
  Widget build(BuildContext context) {

    var args =ModalRoute.of(context)?.settings.arguments as MoviesDetails;

        return Scaffold(
            appBar: AppBar(
                actionsIconTheme: IconThemeData(
                    color: MyTheme.yellowColor
                ),
                title: Text(args.title!, style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall
                    ?.
                copyWith(color: MyTheme.yellowColor),
                ),
                backgroundColor: MyTheme.primaryLightColor,
                centerTitle: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)
                    )
                )
            ),
            backgroundColor: MyTheme.primaryLightColor,
            body: Column(
              children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Stack(
                     children: [
                      Image.network(
                        '${APIConstants.imageUrl}${args.posterPath}' ,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height*0.2,
                      ), Center(
                         child: ImageIcon(
                           const AssetImage('assets/images/play_button.png',),
                           color: MyTheme.whiteColor,
                           size: 100,
                         ),
                       ),

                     ],
                   ),
                 ),
                Row(
                  children: [
                    Text(args.title!,style: Theme
                          .of(context).textTheme.titleMedium,textAlign: TextAlign.start,
                      ),
                  ],
                ),
                SizedBox(height: 6,),
                Row(
                  children: [
                    Text(args.releaseDate!,style: Theme
                        .of(context).textTheme.titleSmall?.copyWith(color: MyTheme.gryColor,fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.25,
                  child: Row(children: [
                    Stack(
                      children: [
                        Image.network("${APIConstants.imageUrl}${args.posterPath}") ,
                        Image.asset('assets/images/add_icon.png'),
                        Icon(Icons.add,color: MyTheme.whiteColor,),
                      ],
                    ),
                    Column(children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: MyTheme.yellowColor,
                            size: 24.sp,
                          ),
                          Text('${args.voteAverage}',style:Theme
                              .of(context).textTheme.titleSmall?.copyWith(color: MyTheme.yellowColor,fontSize: 14) ,),
                        ],
                      ),
                      // Text(args.overview!,style:Theme
                      //     .of(context).textTheme.titleSmall?.copyWith(color: MyTheme.whiteColor,fontSize: 14))
                    ],)




                  ],),
                )
               ],
            ),
          );
      }
}

