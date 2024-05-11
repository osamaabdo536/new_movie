import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_movie/search/search_tab.dart';
import 'package:new_movie/splash_screen.dart';
import 'browse/category_details_screen.dart';
import 'details/popular_details.dart';
import 'home_screen.dart';
import 'my_theme.dart';
import 'onBoardingScreen/ongoing_board_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            SearchTab.routeName: (context) => SearchTab(),
            CategoryDetails.routName: (context) => CategoryDetails(),
            PopularDetailsScreen.routeName: (context) =>
                PopularDetailsScreen(),
            OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
          },
          debugShowCheckedModeBanner: false,
          theme: MyTheme.darkTheme,
        );
      }));
}
