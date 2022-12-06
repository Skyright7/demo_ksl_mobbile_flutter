import 'package:flutter/material.dart';
import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class OrderSuccessPage extends StatefulWidget {
  const OrderSuccessPage({Key? key, required this.title, required this.startTime, required this.endTime, required this.seatId}) : super(key: key);

  final String title;

  final int startTime;

  final int endTime;

  final int seatId;

  @override
  State<OrderSuccessPage> createState() => _OrderSuccessPageState(this.title,this.startTime,this.endTime,this.seatId);
}

class _OrderSuccessPageState extends State<OrderSuccessPage> {

  String _title;

  int _startTime;

  int _endTime;

  int _seatId;

  int _userId = 1;

  int _orderId = 0;

  _OrderSuccessPageState(this._title,this._startTime,this._endTime,this._seatId);

  Map<String,dynamic> _datamap = {};


  @override
  void initState() {
    super.initState();
    this._getData();
  }
  void _getData() async{
    try {
      _datamap["endTime"] = this._endTime;
      _datamap["seatId"] = this._seatId;
      _datamap["startTime"] = this._startTime;
      _datamap["userId"] = this._userId;
      Response response = await Dio().post('http://localhost:8080/bookingASeat/stepThree',data: _datamap);
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._orderId = data["data"];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: _title,),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Container(
              color: Colors.green,
              child: Center(
                child: Container(
                  child: Text("Congraduations! Your order is Success!",style: TextStyle(fontSize: 26)),
                ),
              ),
            ),
          ),
          Container(
            child: Text("Your Order Number:",style: TextStyle(fontSize: 26)),
          ),
          Container(
            child: Text("$_orderId",style: TextStyle(fontSize: 26)),
          ),
          Container(
            child: Center(
              child: ElevatedButton.icon(
                onPressed:() {
                  Navigator.pushNamed(context, "/",arguments:{'title': 'Flutter Demo Home Page',"myNavIndex":0});
                },
                icon: Icon(Icons.home),
                label: Text("Check Your order detail(not done)"),
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
                label: Text("Finish and Back to HomePage!"),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
