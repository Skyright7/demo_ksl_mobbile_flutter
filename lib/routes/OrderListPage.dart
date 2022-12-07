//通过用户Id找到其所有list并展示出来（仿照message page)
import 'package:demo_ksl_mobbile/routes/OrderDetailPage.dart';
import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:demo_ksl_mobbile/widgets/OrderCard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class OrderListPage extends StatefulWidget {
  const OrderListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<OrderListPage> createState() => _OrderListPageState(title);
}

class _OrderListPageState extends State<OrderListPage> {

  String _title;

  _OrderListPageState(this._title);

  //假设我们的是用户一号：id = 1;
  final int userId = 1;

  List<dynamic> _orderIdList = [];
  @override
  void initState() {
    super.initState();
    this._getData();
  }
  void _getData() async{
    try {
      Response response = await Dio().get('http://localhost:8080/order/list/$userId');
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._orderIdList = data["data"];
      });
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: _title,
      ),
      body: ListView.builder(
        itemCount: _orderIdList.length,
        //prototypeItem: MyMessageCard(),
        itemBuilder: (context, index){
          final int id = _orderIdList[index];
          return InkWell(child: OrderCard(orderId: id,),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(
                builder: (context) {
                  return OrderDetailPage(orderId: id);
                },
              ),
              );
            },);
        },
      ),
    );
  }
}
