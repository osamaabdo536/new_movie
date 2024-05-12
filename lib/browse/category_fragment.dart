import 'package:flutter/material.dart';
import '../model/categoryDM.dart';
import '../my_theme.dart';
import 'category/category_item.dart';
import 'category_details_screen.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryDM.getCategories();

  /// list<categoryDM>
  Function onCategoryClick;
  CategoryFragment({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: MyTheme.blackColor,
          body: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Browse Category",
                  style: TextStyle(
                    color: MyTheme.whiteColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 35,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            onCategoryClick(categoriesList[index]);
                            Navigator.of(context).pushNamed(
                              CategoryDetails.routName,
                              arguments: categoriesList[index],
                            );
                          },
                          child: CategoryItem(
                            categoryDetails: categoriesList[index],
                            index: index,
                            CategoryDM: null,
                          ));
                    },
                    itemCount: categoriesList.length,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
CategoryDM? selectedCategory;
void onCategoryClick(CategoryDM newSelectedCategory){
  selectedCategory = newSelectedCategory;
}
