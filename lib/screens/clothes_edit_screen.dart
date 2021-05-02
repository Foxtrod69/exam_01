import 'package:flutter/material.dart';
import 'package:midterm_01/data/models/clothes_model.dart';
import 'package:midterm_01/data/repository/clothes_helper.dart';

class EditMovieScreen extends StatefulWidget {
  static const routeName = '/edit-movie-screen';

  @override
  _EditMovieScreenState createState() => _EditMovieScreenState();
}

class _EditMovieScreenState extends State<EditMovieScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController clothesID;
  TextEditingController clothesName;
  TextEditingController clothesImage;
  TextEditingController clothesSize;
  TextEditingController clothesPrice;
  TextEditingController clothesDescription;

  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context).settings.arguments as Map;
    final Clothes clothes = parsedData['clothes'];
    final int index = parsedData['index'];
    clothesID = TextEditingController(text: clothes.id.toString());
    clothesName = TextEditingController(text: clothes.name);
    clothesImage = TextEditingController(text: clothes.imageUrl);
    clothesSize = TextEditingController(text: clothes.size.toString());
    clothesPrice = TextEditingController(text: clothes.price.toString());
    clothesDescription = TextEditingController(text: clothes.description);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: clothesID,
                    decoration: InputDecoration(hintText: 'Please enter ID'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid ID";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothesName,
                    decoration: InputDecoration(hintText: 'Please enter name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid name";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothesImage,
                    decoration: InputDecoration(hintText: 'Please enter image'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid image";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothesSize,
                    decoration: InputDecoration(hintText: 'Please enter size'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid size";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothesPrice,
                    decoration: InputDecoration(hintText: 'Please enter price'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid price";
                      }
                      return null;
                    },
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: clothesDescription,
                    decoration:
                        InputDecoration(hintText: 'Please enter description'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter valid description";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Back'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          Clothes clothes = Clothes(
                            id: int.tryParse(clothesID.text),
                            name: clothesName.text,
                            imageUrl: clothesImage.text,
                            size: clothesSize.text,
                            price: double.tryParse(clothesPrice.text),
                            description: clothesDescription.text,
                          );
                          ClothesRepository().editClothes(clothes, index);
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Edit'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
