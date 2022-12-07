import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class OrderCard extends StatefulWidget {
  const OrderCard({Key? key, required this.orderId}) : super(key: key);

  final int orderId;

  @override
  State<OrderCard> createState() => _OrderCardState(orderId);
}

class _OrderCardState extends State<OrderCard> {

  int _orderId;

  _OrderCardState(this._orderId);

  Map<String,dynamic> _datamap = {};

  String _orderTime = "";

  int _orderStatus = 1;

  int _orderItemId = 0;

  String _smallStatus = "";

  @override
  void initState() {
    super.initState();
    this._getData();
  }
  void _getData() async{
    try {
      Response response = await Dio().get('http://localhost:8080/order/$_orderId');
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._datamap = data["data"];
        this._orderTime = this._datamap["orderTime"];
        this._orderStatus = this._datamap["orderStatus"];
        this._orderItemId = this._datamap["orderItemId"];
        if(this._orderStatus==1){
          this._smallStatus = "ordered";
        }
        else if(this._orderStatus==2){
          this._smallStatus = "seated";
        }
        else{
          this._smallStatus = "done";
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Container(
              //头图
              child: Image.asset("/Users/gengyuliu/StudioProjects/demo_ksl_mobbile/lib/assets/image/seat/$_orderItemId.png",fit: BoxFit.fill,width: 80,
                height: 80,),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text("Order No.$_orderId",style: TextStyle(fontSize: 25)),
                    Text("Your order time is:"),
                    Text(_orderTime),
                  ],
                ),
              ),
            ),
            Container(
              child: Text(_smallStatus),
            )
          ],
        ),
      ),
    );
  }
}
