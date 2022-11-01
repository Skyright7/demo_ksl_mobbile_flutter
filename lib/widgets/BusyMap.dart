import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';

//后续通过第三方做更好的动画性质定制比如 Fl_chart

class MyBusyMap extends StatelessWidget {
  const MyBusyMap({Key? key}) : super(key: key);


  final double percentage = 80;

  @override
  Widget build(BuildContext context) {
    List<BrnDoughnutDataItem> dataList = [];
    dataList.add(BrnDoughnutDataItem(value: this.percentage,title: "busy",color: Color.fromARGB(255, 10, 48, 78)));
    dataList.add(BrnDoughnutDataItem(value: (100-this.percentage),title: "empty",color: Color.fromARGB(255, 106, 106, 106)));
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
        ],
      ),
    );
  }
}