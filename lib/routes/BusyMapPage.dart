import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:demo_ksl_mobbile/widgets/BusyMap.dart';
import 'package:demo_ksl_mobbile/widgets/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';

class MyBusyPage extends StatefulWidget {
  const MyBusyPage({Key? key, required this.title, required this.navIndex}) : super(key: key);

  final int navIndex;
  final String title;
  @override
  State<MyBusyPage> createState() => _MyBusyPageState(title,navIndex);
}

class _MyBusyPageState extends State<MyBusyPage> {

  final int navIndex;
  final String title;
  _MyBusyPageState(this.title,this.navIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: title,
      ),
      body: Center(
        child: MyBusyMap(),
      ),
      bottomNavigationBar: MyNavBar(myNavIndex: navIndex,),
    );
  }
}

