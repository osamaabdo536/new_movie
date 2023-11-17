import 'package:flutter/material.dart';
import 'package:movie/my_theme.dart';
import 'package:movie/watch_list/WatchList_Item.dart';
import 'package:provider/provider.dart';

import '../Provider/watchlist_Provider.dart';
import '../details/popular_details.dart';

class WatchList extends StatelessWidget {
  static const String routeName = "watchlist";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (provider.watchList.isEmpty) {
      provider.getAllMoviesFromFirestore();
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              'Watch list',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 2,
                    color: MyTheme.gryColor,
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          PopularDetailsScreen.routeName,
                          arguments: provider.watchList[index]);
                    },
                    child: WatchListItem(
                        poster: provider.watchList[index].posterPath,
                        title: provider.watchList[index].title,
                        releaseDate: provider.watchList[index].releaseDate,
                        voteAverage: provider.watchList[index].voteAverage),
                  );
                },
                itemCount: provider.watchList.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
