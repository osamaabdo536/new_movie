import 'package:flutter/material.dart';
import '../my_theme.dart';
import '../search/search_tab.dart';
import 'browse/category_fragment.dart';
import 'home/home_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.blackColor,
      bottomNavigationBar: Theme(
        data:
            Theme.of(context).copyWith(canvasColor: MyTheme.primaryLightColor),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/Home_icon.png'),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/search-2.png'),
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/browse.png'),
                ),
                label: 'Browse'),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    CategoryFragment(onCategoryClick: onCategoryClick),
  ];
}
