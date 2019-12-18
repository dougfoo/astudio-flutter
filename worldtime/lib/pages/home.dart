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

    String bgImage = this.data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = this.data['isDaytime'] ? Colors.blue[300] : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
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
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');  // pop from choose location
                      setState(() {
                        this.data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDaytime': result['isDaytime'],
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('edit location')),
                SizedBox(height: 20.0),
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
