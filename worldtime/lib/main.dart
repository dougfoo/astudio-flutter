import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/photo.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/pref.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/photos': (context) => Photo(),
    '/location': (context) => Location(),
    '/pref': (context) => Pref(),    '/location': (context) => Location(),

  },
));

