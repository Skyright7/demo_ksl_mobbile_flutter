import 'package:demo_ksl_mobbile/routes/BookingASeatPage1.dart';
import 'package:demo_ksl_mobbile/routes/BookingASeatPage2.dart';
import 'package:demo_ksl_mobbile/routes/BookingASeatPage3.dart';
import 'package:demo_ksl_mobbile/routes/BusyMapPage.dart';
import 'package:demo_ksl_mobbile/routes/MessagePage.dart';
import 'package:demo_ksl_mobbile/routes/ScannerPage.dart';
import 'package:demo_ksl_mobbile/routes/SuccessPage.dart';
import 'package:demo_ksl_mobbile/routes/UserInfoPage.dart';
import 'package:flutter/material.dart';
import 'routes/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page',myNavIndex: 0,),
      routes: {
        '/busyMap': (BuildContext context) => MyBusyPage(title: "Busy Page", navIndex: 1,),
        '/scanner': (BuildContext context) => MyScannerPage(title: "Scanner Page", myNavIndex: 2,),
        '/messagePage':(BuildContext context) => MyMessagePage(title: "Message Page", myNavIndex: 3,),
        '/userPage':(BuildContext context) => MyUserInfoPage(title: "User Page", myNavIndex: 4,),
        '/BookingASeat/1':(BuildContext context) => BookingSeatStepOnePage(title: "Step One"),
        '/BookingASeat/2':(BuildContext context) => BookingSeatStepTwoPage(title: "Step Two"),
        '/BookingASeat/3':(BuildContext context) => BookingSeatStepThreePage(title: "Step Three"),
        '/success':(BuildContext context) => SuccessPage(title: "Booking Suceessful!"),
      },
    );
  }
}
