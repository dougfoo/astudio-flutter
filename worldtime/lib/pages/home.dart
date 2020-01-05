import 'package:flutter/material.dart';
import 'package:worldtime/data.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:worldtime/pages/pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<WorldTime> locations;
  PageController controller;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    locations = AppData().locations;
    int index = SharedPreferencesHelper.getTimezoneIndex();  // init in loader
    print('locindex is $index');
    controller = PageController(
      initialPage: index,
      keepPage: true
    );
  }

  List<MyContainer> createContainers(List<WorldTime> wts) {
    List<MyContainer> list = new List<MyContainer>();
    wts.forEach((item) {
      list.add(MyContainer(item.time, item.location,item.image, controller));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<MyContainer> containers = createContainers(locations);

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
                          controller.jumpToPage(result['index']);
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