import 'dart:core';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vikkru/Form/Page1.dart';
import 'package:vikkru/HomeScreen.dart';

import 'package:vikkru/Pdf/PdfPrevievScreen.dart';

import 'Auth/Login.dart';
import 'Auth/Registration.dart';
import 'Form/Page2.dart';
import 'Form/Page3.dart';
import 'Form/Page4.dart';
import 'Form/Page5.dart';
import 'Pdf/pdf.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static final String routeHome = '/home';
  static final String routeLogin = '/login';
  static final String routeRegistration = '/registration';
  static final String authScreen = '/auth';
  static final String userPrefKey = 'user';
  static final String page1 = '/page1';
  static final String page2 = '/page2';
  static final String page3 = '/page3';
  static final String page4 = '/page4';
  static final String page5 = '/page5';

  static int curUser = -1;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences _preferences;
  bool isInit = true;

  init() {
    if (isInit) {
      SharedPreferences.getInstance()
        ..then((prefs) {
          setState(() {
            this._preferences = prefs;
            _loadUserPref();
          });
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyApp.curUser == -1 ? MyApp.routeLogin : MyApp.authScreen,
      routes: {
        MyApp.routeHome: (BuildContext context) => MyHomePage(),
        MyApp.routeLogin: (BuildContext context) => LoginScreen(),
        MyApp.routeRegistration: (BuildContext context) => RegistrationScreen(),
        MyApp.page1: (BuildContext context) => Page1(),
        MyApp.page2: (BuildContext context) => Page2(),
        MyApp.page3: (BuildContext context) => Page3(),
        MyApp.page4: (BuildContext context) => Page4(),
        MyApp.page5: (BuildContext context) => Page5()
      },
      title: 'Flutter demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Page1(),
    );
  }

  void _loadUserPref() {
    setState(() {
      MyApp.curUser = this._preferences.getInt(MyApp.userPrefKey) ?? -1;
    });
  }
}
