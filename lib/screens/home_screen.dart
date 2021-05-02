import 'package:flutter/material.dart';
import 'package:midterm_01/data/models/clothes_model.dart';
import 'package:midterm_01/data/models/dummy_data.dart';
import 'package:midterm_01/screens/add_new_clothes_screen.dart';
import 'package:midterm_01/screens/clothes_details_screen.dart';
import 'package:midterm_01/screens/clothes_edit_screen.dart';
import 'package:midterm_01/widgets/main_list_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Clothes> clothesList = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothes App'),
        centerTitle: true,
      ),
      // drawer: Drawer,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (ctx, index) {
            var clothes = clothesList[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(
                  context, ClothesDetailsScreen.routeName,
                  arguments: clothes),
              onLongPress: () {
                Navigator.pushNamed(
                  context,
                  EditMovieScreen.routeName,
                  arguments: {'clothes': clothes, 'index': index},
                ).then((_) {
                  setState(() {});
                });
              },
              child: MainListItem(
                imageUrl: clothes.imageUrl,
                name: clothes.name,
                price: clothes.price.toString(),
              ),
            );
          },
          itemCount: clothesList.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AddNewClothes.routeName).then((_) {
          setState(() {});
        }),
        child: Icon(Icons.add),
      ),

    );
  }
}
