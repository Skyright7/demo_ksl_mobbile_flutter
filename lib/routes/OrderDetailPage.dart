//需要传入orderid，然后展示order详情
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:demo_ksl_mobbile/widgets/AppBar.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({Key? key, required this.orderId}) : super(key: key);

  final int orderId;

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState(orderId);
}

class _OrderDetailPageState extends State<OrderDetailPage> {

  final int _orderId;

  _OrderDetailPageState(this._orderId);

  Map<String,dynamic> _dataMap = {};

  String _orderTime = "";

  int _orderItemId = 0;

  int _orderStatus = 0;

  String _orderStage = "";

  @override
  void initState() {
    super.initState();
    this._getData();
  }
  void _getData() async{
    try {
      Response response = await Dio().get('http://localhost:8080//order/$_orderId');
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._dataMap = data["data"];
        this._orderItemId = this._dataMap["orderItemId"];
        this._orderTime = this._dataMap["orderTime"];
        this._orderStatus = this._dataMap["orderStatus"];
        if(_orderStatus==1){
          this._orderStage = "Orderer but not arrive";
        }
        else if(_orderStatus == 2){
          this._orderStage = "Arrive and check in,Order in process";
        }
        else{
          this._orderStage = "Checked out, Order finished";
        }
      });
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Order:$_orderId"),
      body: Column(
        children: [
          Container(
            child: Text("Your order time is: $_orderTime",style: TextStyle(fontSize: 25)),
          ),
          Container(
            child: Text("Your order status is:",style: TextStyle(fontSize: 25)),
          ),
          Container(
            child: Text("$_orderStage",style: TextStyle(fontSize: 25)),
          ),
          Container(
            child: Text("Your order Item number is: $_orderItemId",style: TextStyle(fontSize: 25)),
          ),
          Container(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Center(
                child: Container(
                  child: Image.asset("/Users/gengyuliu/StudioProjects/demo_ksl_mobbile/lib/assets/image/seat/$_orderItemId.png"),
                ),
              ),
            ),
          ),
          Expanded(child: Container(
            child: Center(
              child: ElevatedButton.icon(
                onPressed:() {
                  Navigator.pushNamed(context, "/",arguments:{'title': 'Flutter Demo Home Page',"myNavIndex":0});
                },
                icon: Icon(Icons.home),
                label: Text("Back to HomePage!"),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
