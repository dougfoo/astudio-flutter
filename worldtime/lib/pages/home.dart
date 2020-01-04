import 'dart:math';
import 'package:flutter/material.dart';
import 'package:worldtime/data.dart';
import 'package:worldtime/services/worldtime.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  List<WorldTime> locations = AppData().locations;


  final controller = PageController(
      initialPage: 1,
      keepPage: true
  );

  List<MyContainer> createContainers(List<WorldTime> wts) {
    List<MyContainer> list = new List<MyContainer>();
    wts.forEach((item) {
      print("created ${item.time} ${item.image} ");
      list.add(MyContainer(item.time, item.location,item.image, controller));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    print('home::build');
    List<MyContainer> containers = createContainers(locations);
    print("containers: ${containers}");

    return Scaffold(
        backgroundColor: Colors.blue,
        floatingActionButton: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text('Handicap feature coming soon, for now try swiping left/right !!')));
            },
            tooltip: 'Help',
            child: Icon(Icons.accessible),
          );
        }),
        body: SafeArea (
          child: PageView (
              controller: controller,
              children: containers,

          ),
        )
    );
  }
}

class MyContainer extends StatelessWidget  {
  String time; // = "19:59:59";
  String location; // = "Charlotte";
  String image; // = "Niseko_BC_05.jpg";
  PageController controller;

  MyContainer(this.time, this.location, this.image, this.controller);

  Widget build(context) {
    return new Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/${this.image}'),
            fit: BoxFit.cover,
          )
      ),

      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                      onTap: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');  // pop from choose location
                        print('location ${result}');
//                        controller.animateToPage(result['index']);   // dont work so well
                          controller.jumpToPage(result['index']);
//                        setState(() {
//                          this.data = {
//                            'time': result['time'],
//                            'location': result['location'],
//                            'flag': result['flag'],
//                            'isDaytime': result['isDaytime'],
//                          };
//                        });
                      },
                      onLongPress: () async {
                        dynamic result = await Navigator.pushNamed(context, '/pref');  // pop from choose location
                      },
                      onDoubleTap: () async {
                        dynamic result = await Navigator.pushNamed(context, '/Home');  // pop from choose location
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.edit_location),
                          Text('Edit Defaults'),
                        ],
                      )
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    this.location,
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    )
                ),
                SizedBox(width: 20.0,),
                Text(
                    this.time,
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 1.4,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}