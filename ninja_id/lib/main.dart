import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: FooCard()
));

class FooCard extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _FooCardState createState() => _FooCardState();
}

class _FooCardState extends State<FooCard> {
  int fooLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Foo Dir'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/dog2.jpg'),
                radius: 40,
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[350],
            ),
            Text(
                'NAME',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2,
                ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Foo Dog',
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Foo State',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$fooLevel',
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Icon (
                  Icons.email,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text (
                  'foo@foo.com',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 18.0,
                    letterSpacing: 1.5,
                  )
                )
              ],
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            fooLevel += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
    );
  }
}

