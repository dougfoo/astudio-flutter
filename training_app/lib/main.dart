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
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                color:Colors.cyan,
                padding: EdgeInsets.all(50),
                child: Text('CRow1')
              ),
              Container(
                  color:Colors.green,
                  padding: EdgeInsets.all(50),
                  child: Text('CRow2')
              )
            ],
          ),
          Text('Row1'),
          Text('Row2'),
          FlatButton(
            onPressed: () {
              print('pressed me');
            },
            child: Text('Press me'),
          ),
          Container(
            color:Colors.cyan,
            padding: EdgeInsets.all(50),
            child: Text('Row3')
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