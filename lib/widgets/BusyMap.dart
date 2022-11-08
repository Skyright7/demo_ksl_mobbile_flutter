import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';
import 'package:dio/dio.dart';
import 'dart:convert'; //格式转换包

//后续通过第三方做更好的动画性质定制比如 Fl_chart
class MyBusyMap extends StatefulWidget {
  const MyBusyMap({Key? key}) : super(key: key);

  @override
  State<MyBusyMap> createState() => _MyBusyMapState();
}

class _MyBusyMapState extends State<MyBusyMap> {


  Map<String,dynamic> _map = {};

  double _percentage = 0;

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() async{
    try {
      Response response = await Dio().get('http://localhost:8080/busyCheck');
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._map = data["data"];
        int per = this._map["busyStatement"];
        this._percentage = per.toDouble();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<BrnDoughnutDataItem> dataList = [];
    dataList.add(BrnDoughnutDataItem(value: this._percentage,title: "busy",color: Color.fromARGB(255, 10, 48, 78)));
    dataList.add(BrnDoughnutDataItem(value: 100 - this._percentage,title: "empty",color: Color.fromARGB(255, 106, 106, 106)));
    return Container(
      child: Column(
        children: <Widget>[
          BrnDoughnutChart(
            padding: EdgeInsets.all(50),
            width: 200,
            height: 200,
            data: dataList,
            selectedItem: dataList[0],
            showTitleWhenSelected: true,
          ),
          Container(
            child: Center(child: Text("The total is $_percentage % busy."),),
          ),
        ],
      ),
    );
  }
}



