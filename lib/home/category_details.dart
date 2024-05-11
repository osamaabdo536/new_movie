import 'package:flutter/material.dart';
import '../api/api_manager.dart';

class CategoryDetails extends StatefulWidget {
   static const String routeName= 'categoryDetails';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: FutureBuilder<dynamic>(
          future: APIManager.getPopular(),
          builder:(context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if (snapshot.hasError){
              return Column(
                children: [
                  const Text('Something went wrong'),
                  Center(
                    child: ElevatedButton(onPressed:()
                    {
                      APIManager.getPopular();
                      setState(() {});
                    }, child: const Text('try again')),
                  ),
                ],
              );
            }if(snapshot.data?.success == false){
              return Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.statusMessage??''),
                  Center(
                    child: ElevatedButton(onPressed:()
                    {
                      APIManager.getPopular();
                      setState(() {});
                    }, child: const Text('try again')),
                  ),
                ],
              );
            }
            var popularList = snapshot.data?.results??[];
            return ListView.builder(
              itemBuilder:(context,index){
                return Container(
                  child:Row(
                    children: [
                      Text(popularList[index].title??'')
                    ],
                  ),
                ) ;
              },
              itemCount: popularList.length,
            );
          },
        ),
      );

  }
}
