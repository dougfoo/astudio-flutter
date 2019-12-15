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
      body: Center(
          child: Text('Foo Hello',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.amber[600]
              )
          ),
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