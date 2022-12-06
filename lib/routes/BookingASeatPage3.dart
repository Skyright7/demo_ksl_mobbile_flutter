import 'package:demo_ksl_mobbile/routes/OrderSuccessPage.dart';
import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class BookingSeatStepThreePage extends StatefulWidget {
  const BookingSeatStepThreePage({Key? key, required this.title, required this.seatId, required this.arriveTime}) : super(key: key);

  final String title;

  final int seatId;

  final int arriveTime;

  @override
  State<BookingSeatStepThreePage> createState() => _BookingSeatStepThreePageState(title,seatId,arriveTime);
}
//记得定制一下appbar，这样可以不加入navbar
class _BookingSeatStepThreePageState extends State<BookingSeatStepThreePage> {

  final String title;

  final int _seatId;

  final int _arriveTime;

  _BookingSeatStepThreePageState(this.title, this._seatId, this._arriveTime);

  String _today = "";

  Map<String,dynamic> _dataMap = {};

  String _position = "";

  String _floor = "";

  String _area = "";

  int _seatType = 0;

  String _availableTime = "";

  List<int> _endTimeChoose = [];

  int _endTime = 0;

  @override
  void initState() {
    super.initState();
    this._getData();
  }
  void _getData() async{
    try {
      Response response = await Dio().get('http://localhost:8080/bookingASeat/stepTwo/$_seatId');
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._dataMap = data["data"];
        DateTime dateTime= DateTime.now();
        this._today = dateTime.toString().substring(0,10);
        this._position = this._dataMap["seatPosition"];
        this._floor = this._position.split('-')[0];
        this._area = this._position.split('-')[1];
        this._seatType = this._dataMap["seatType"];
        this._availableTime = this._dataMap["seatAvailableTime"];
        List<String> timeArrAll = _availableTime.split(',');
        timeArrAll.forEach((element) {
          String s1 = element.split('-')[0];
          String s2 = element.split('-')[1];
          int start = int.parse(s1);
          int end = int.parse(s2);
          if(start<=_arriveTime && _arriveTime<end){
            for(int i = _arriveTime+1; i <= end;i++){
              this._endTimeChoose.add(i);
            }
          }
        });
        this._endTime = _endTimeChoose[0];
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
            child: Text("Please Confirm your order detail and choose one finish time:",style: TextStyle(fontSize: 25)),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  child: Text("Your seat Floor is:  $_floor"),
                ),
                Container(
                  child: Text("Your seat Area is:  $_area"),
                ),
                Container(
                  child: Text("Your seat Type is: type $_seatType"),
                ),
                Container(
                  child: Text("Available time: $_availableTime"),
                ),
                Container(
                  child: Text("Seat id: $_seatId"),
                ),
                Container(
                  child: Text("End time Choice is: $_endTimeChoose"),
                ),
                Container(
                  child: Text("Below is the image of your seat:"),
                ),
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Center(
                    child: Container(
                      child: Image.asset("/Users/gengyuliu/StudioProjects/demo_ksl_mobbile/lib/assets/image/seat/$_seatType.png"),
                    ),
                  ),
                ),
                Container(
                  child: Text("Your order date is: $_today"),
                ),
                Container(
                  child: Text("Your arriving time is: $_arriveTime"),
                ),
                Container(
                  child: Text("Please choose your end time here:"),
                ),
                DropdownButton<int>(
                  value: _endTime,
                    icon: Icon(
                      Icons.expand_more,
                      size: 20,
                    ),
                    items: _buildItems(),
                    onChanged: (v)=>setState(() {
                      this._endTime = v??_endTimeChoose[0];
                    }),
                ),
                Expanded(child: Container(
                  child: Center(
                    child: ElevatedButton.icon(
                      onPressed:() {
                        Navigator.push(context,MaterialPageRoute(
                          builder: (context) {
                            return OrderSuccessPage(title: "Success", startTime: _arriveTime, endTime: _endTime,seatId: _seatId,);
                          },
                        ));
                      },
                      icon: Icon(Icons.add_circle_outline),
                      label: Text("Finish and Submit your choice!"),
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
  List<DropdownMenuItem<int>> _buildItems() => _endTimeChoose.map((e) => DropdownMenuItem<int>(value: e,
    child: Text("Choose end time : $e"),
  )).toList();
}