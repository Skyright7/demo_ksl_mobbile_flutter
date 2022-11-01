import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:demo_ksl_mobbile/widgets/NavBar.dart';
import 'package:flutter/material.dart';

class MyScannerPage extends StatefulWidget {
  const MyScannerPage({Key? key, required this.title, required this.myNavIndex}) : super(key: key);

  final String title;

  final int myNavIndex;

  @override
  State<MyScannerPage> createState() => _MyScannerPageState(title,myNavIndex);
}

class _MyScannerPageState extends State<MyScannerPage> {

  final String title;

  final int myNavIndex;

  _MyScannerPageState(this.title,this.myNavIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: title,
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 400,
          child: Center(
            child: Text("here put the Scannner")),
        ),
      ),
      bottomNavigationBar: MyNavBar(myNavIndex: myNavIndex,),
    );
  }
}
