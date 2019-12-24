import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    this.data = data.isEmpty ? ModalRoute.of(context).settings.arguments : this.data;
    print(this.data);

    //String bgImage = this.data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    int r = Random().nextInt(14) + 1;
    String bgImage = r < 10 ? "Niseko_BC_0${r}.jpg" : "Niseko_BC_${r}.jpg";
    
    Color bgColor = this.data['isDaytime'] ? Colors.blue[300] : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text('Hello!')));
            },
            tooltip: 'Help',
            child: Text('+'),
        );
      }),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/${bgImage}'),
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
                          setState(() {
                            this.data = {
                              'time': result['time'],
                              'location': result['location'],
                              'flag': result['flag'],
                              'isDaytime': result['isDaytime'],
                            };
                          });                        },
                        onLongPress: () async {
                          dynamic result = await Navigator.pushNamed(context, '/pref');  // pop from choose location
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.edit_location),
                            Text('Edit Location'),
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
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                        )
                    ),
                    SizedBox(width: 20.0,),
                    Text(
                        data['time'],
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
        ),
      )
    );
  }
}
