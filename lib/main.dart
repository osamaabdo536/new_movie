import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/Provider/watchlist_Provider.dart';
import 'package:movie/search/search_tab.dart';
import 'package:movie/splash_screen.dart';
import 'package:movie/watch_list/watch_list.dart';
import 'package:provider/provider.dart';
import 'browse/category_details_screen.dart';
import 'details/popular_details.dart';
import 'home_screen.dart';
import 'my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      child: ScreenUtilInit(
          designSize: const Size(412, 870),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              initialRoute: HomeScreen.routeName,
              routes: {
                SplashScreen.routeName: (context) => const SplashScreen(),
                HomeScreen.routeName: (context) => HomeScreen(),
                SearchTab.routeName: (context) => SearchTab(),
                WatchList.routeName: (context) => WatchList(),
                CategoryDetails.routName : (context)=> CategoryDetails(),
                PopularDetailsScreen.routeName: (context) =>
                    PopularDetailsScreen(),
              },
              debugShowCheckedModeBanner: false,
              theme: MyTheme.darkTheme,
            );
          })));
}
