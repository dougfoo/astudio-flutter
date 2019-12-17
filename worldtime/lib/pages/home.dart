import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    this.data = ModalRoute.of(context).settings.arguments;
    print(this.data);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
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
      )
    );
  }
}
