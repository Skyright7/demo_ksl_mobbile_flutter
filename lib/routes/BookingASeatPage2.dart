import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class BookingSeatStepTwoPage extends StatefulWidget {
  const BookingSeatStepTwoPage({Key? key, required this.title, required this.dataMap}) : super(key: key);

  final Map dataMap;

  final String title;

  @override
  State<BookingSeatStepTwoPage> createState() => _BookingSeatStepTwoPageState(title,dataMap);
}
//记得定制一下appbar，这样可以不加入navbar
class _BookingSeatStepTwoPageState extends State<BookingSeatStepTwoPage> {

  final String title;

  final Map _map;

  _BookingSeatStepTwoPageState(this.title,this._map);

  List<dynamic> _seatList = [];

  @override
  void initState() {
    super.initState();
    this._getData();
  }
  void _getData() async{
    try {
      Response response = await Dio().post('http://localhost:8080/bookingASeat/stepOne',data: _map);
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._seatList = data["data"];
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title,),
      body: Column(
        children: [
          Container(
            child: Text("Please Choose one seat from the diagram below",style: TextStyle(fontSize: 25)),
          ),
          Container(
            child: Text("the map is: $_seatList",style: TextStyle(fontSize: 25)),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Center(
                    child: Container(
                      child: Text("这里放可视化的选择图",style: TextStyle(fontSize: 20)),
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(child: Container(
                  child: Center(
                    child: ElevatedButton.icon(
                      onPressed:() {
                        Navigator.pushNamed(context, "/BookingASeat/3",arguments:{'title': "Step Three"});
                      },
                      icon: Icon(Icons.add_circle_outline),
                      label: Text("Submit your choice!"),
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}