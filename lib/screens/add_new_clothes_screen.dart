import 'package:flutter/material.dart';
import 'package:midterm_01/data/models/clothes_model.dart';
import 'package:midterm_01/data/repository/clothes_helper.dart';

class AddNewClothes extends StatelessWidget {
  static const routeName = '/add-new-movie';
  final _formkey = GlobalKey<FormState>();

  TextEditingController clothesID = TextEditingController();
  TextEditingController clothesName = TextEditingController();
  TextEditingController clothesImage = TextEditingController();
  TextEditingController clothesSize = TextEditingController();
  TextEditingController clothesPrice = TextEditingController();
  TextEditingController clothesDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
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
                            price: double.tryParse(clothesPrice.text),
                              size: clothesSize.text,
                            description: clothesDescription.text,
                          );
                          ClothesRepository().addClothes(clothes);
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Add'),
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
