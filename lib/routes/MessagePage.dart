import 'package:demo_ksl_mobbile/routes/MessageDetailPage.dart';
import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:demo_ksl_mobbile/widgets/MessageCard.dart';
import 'package:demo_ksl_mobbile/widgets/NavBar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class MyMessagePage extends StatefulWidget {
  const MyMessagePage({Key? key, required this.title, required this.myNavIndex}) : super(key: key);

  final String title;

  final int myNavIndex;

  @override
  State<MyMessagePage> createState() => _MyMessagePageState(title, myNavIndex);
}

class _MyMessagePageState extends State<MyMessagePage> {

  List<dynamic> _messageIdList = [];
  @override
  void initState() {
    super.initState();
    this._getData();
  }
  void _getData() async{
    try {
      Response response = await Dio().get('http://localhost:8080/message/list/1');
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._messageIdList = data["data"];
      });
    } catch (e) {
      print(e);
    }
  }

  //假设我们的是用户一号：id = 1;
  final int userId = 1;

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
          itemCount: _messageIdList.length,
          //prototypeItem: MyMessageCard(),
          itemBuilder: (context, index){
            final int id = _messageIdList[index];
            return InkWell(child: MyMessageCard(messageId: id,),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(
                builder: (context) {
                  return MessageDetailPage(
                    messageId: id,
                  );
                },
              ),
              );
            },);
          },
      ),
      bottomNavigationBar: MyNavBar(myNavIndex: myNavIndex,),
    );
  }
}
