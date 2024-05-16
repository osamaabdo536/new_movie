import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_movie/home/home_tab.dart';
import 'package:new_movie/splash_screen.dart';
import 'details/popular_details.dart';
import 'my_theme.dart';

void main() async {
  runApp(ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            HomeTab.routeName: (context) => HomeTab(),
            PopularDetailsScreen.routeName: (context) => PopularDetailsScreen(),
          },
          debugShowCheckedModeBanner: false,
          theme: MyTheme.darkTheme,
        );
      }));
}
