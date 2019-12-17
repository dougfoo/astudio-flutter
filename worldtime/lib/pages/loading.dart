import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

// https://jsonplaceholder.typicode.com/todos/1

class _LoadingState extends State<Loading> {
  void getData() async {
    Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data = jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('hey init');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: Text('loading screen'))

    );
  }
}
