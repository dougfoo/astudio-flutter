import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyAppBar'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(30),
                  color:Colors.cyan,
                  child: Text('1'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(30),
                  color:Colors.green,
                  child: Text('2'),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(30),
                  color:Colors.red,
                  child: Text('3'),
                ),
              ),
            ]),
          FlatButton(
            onPressed: () {
              print('pressed me');
            },
            child: Text('Press me'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('hello click');
          },
          child: Text('+')
      ),
    );
  }
}