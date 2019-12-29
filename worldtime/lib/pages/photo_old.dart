import 'dart:math';
import 'package:flutter/material.dart';

/* test code to build a PageView scroller */

class Photo extends StatefulWidget {
  @override
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  String bgImage;
  final controller = PageController(
      initialPage: 1,
      keepPage: true
  );

  flipPhoto() {
    int r = Random().nextInt(14) + 1;
    String image = r < 10 ? "Niseko_BC_0${r}.jpg" : "Niseko_BC_${r}.jpg";
    setState(() {
      this.bgImage = image;
    });
    return image;
  }

  @override
  Widget build(BuildContext context) {

//    flipPhoto();

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: PageView (
          controller: controller,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1547665979-bb809517610d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'),
                      fit: BoxFit.cover
                  ),
                )
            ),
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('https://www.xfive.co/wp-content/uploads/2018/12/snowboarding1.jpg'),
                      fit: BoxFit.cover
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
