import 'package:flutter/material.dart';
import 'package:midterm_01/data/models/clothes_model.dart';
import 'package:midterm_01/data/repository/clothes_helper.dart';

class ClothesDetailsScreen extends StatefulWidget {
  static const routeName = "/details-screen";

  @override
  _ClothesDetailsScreenState createState() => _ClothesDetailsScreenState();
}

class _ClothesDetailsScreenState extends State<ClothesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Clothes clothes = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              ClothesRepository().removeClothes(clothes.id);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Image.network(
              clothes.imageUrl,
              height: 500,
              width: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Text('Name:' + '      ' + clothes.name),
            Text('Price' + '      ' + clothes.price.toString()),
            Text('Size:' + '      ' + clothes.size),
            Text(clothes.description),
          ]),
        ),
      ),
    );
  }
}
