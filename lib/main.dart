
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/search/search_tab.dart';
import 'package:movie/splash_screen.dart';
import 'details/popular_details.dart';
import 'home_screen.dart';
import 'my_theme.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // FirebaseFirestore.instance.settings =
  //     Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  // await Firebase.initializeApp();
  runApp(ScreenUtilInit(
  designSize: const Size(412, 870),
  minTextAdapt: true,
  splitScreenMode: true,
  builder: (context, child) {
  return MaterialApp(
  initialRoute:SplashScreen.routeName ,
    routes: {
     SplashScreen.routeName: (context) => const SplashScreen(),
     HomeScreen.routeName: (context) =>HomeScreen(),
     SearchTab.routeName: (context) =>SearchTab(),
     PopularDetailsScreen.routeName: (context) => PopularDetailsScreen(),
    },
  debugShowCheckedModeBanner: false,
  theme: MyTheme.darkTheme,
  );
  }
  )
  );
}
