import 'package:demo_ksl_mobbile/routes/OrderListPage.dart';
import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:demo_ksl_mobbile/widgets/NavBar.dart';
import 'package:demo_ksl_mobbile/widgets/UserCard.dart';
import 'package:flutter/material.dart';

class MyUserInfoPage extends StatefulWidget {
  const MyUserInfoPage({Key? key, required this.title, required this.myNavIndex}) : super(key: key);

  final String title;

  final int myNavIndex;

  @override
  State<MyUserInfoPage> createState() => _MyUserInfoPageState(title,myNavIndex);
}

class _MyUserInfoPageState extends State<MyUserInfoPage> {

  final String title;

  final int myNavIndex;

  _MyUserInfoPageState(this.title,this.myNavIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: title,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 100,
            child: MyUserCard(userId: 1,),
          ),
          Container(
            child: Center(
              child: ElevatedButton.icon(
                onPressed:() {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) {
                      return OrderListPage(title: "Order list");
                    },
                  ));
                },
                icon: Icon(Icons.dehaze_outlined),
                label: Text("Check Your order detail"),
              ),
            ),
          ),
          Expanded(
              child: Container(
                child: Text("剩下的部分放置各种按钮"),
              ),
          ),
        ],
      ),
      bottomNavigationBar: MyNavBar(myNavIndex: myNavIndex,),
    );
  }
}
