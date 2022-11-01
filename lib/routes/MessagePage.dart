import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:demo_ksl_mobbile/widgets/MessageCard.dart';
import 'package:demo_ksl_mobbile/widgets/NavBar.dart';
import 'package:flutter/material.dart';

class MyMessagePage extends StatefulWidget {
  const MyMessagePage({Key? key, required this.title, required this.myNavIndex}) : super(key: key);

  final String title;

  final int myNavIndex;

  @override
  State<MyMessagePage> createState() => _MyMessagePageState(title, myNavIndex);
}

class _MyMessagePageState extends State<MyMessagePage> {

  final String title;
  final int myNavIndex;

  _MyMessagePageState(this.title,this.myNavIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: title,
      ),
      body: ListView.builder(
          itemCount: 10,
          prototypeItem: MyMessageCard(),
          itemBuilder: (context, index){
            return MyMessageCard();
          },
      ),
      bottomNavigationBar: MyNavBar(myNavIndex: myNavIndex,),
    );
  }
}
