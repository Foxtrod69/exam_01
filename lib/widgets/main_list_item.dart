import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const MainListItem({
    Key key,
    this.imageUrl,
    this.name,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 200,
          width: 180,
          child: FadeInImage(
            placeholder: AssetImage('assets/images/clothes_placeholder.png'),
            image: NetworkImage(imageUrl),
          ),
        ),
        Text(name),
        Text(price),
      ],
    );
  }
}
