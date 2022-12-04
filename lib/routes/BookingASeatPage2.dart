import 'package:demo_ksl_mobbile/routes/BookingASeatPage3.dart';
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

  List<int> _seatIndexList = [];

  int _selectedId = 0;

  int _selectedSeatType = 0;
  int _selectedSeatId = 0;
  String _selectedSeatPosition = "";
  String _selectedSeatAvailableTime = "";

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
        for(int i = 0; i < this._seatList.length; i++){
          this._seatIndexList.add(i);
        };
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    int arrivetime = _map["arrivingTime"];
    return Scaffold(
      appBar: MyAppBar(title: title,),
      body: Column(
        children: [
          Container(
            child: Text("Please Choose one seat",style: TextStyle(fontSize: 25)),
          ),
          Container(
            child: SizedBox(
              width: 400,
              height: 400,
              child: Container(
                child: Image.asset("/Users/gengyuliu/StudioProjects/demo_ksl_mobbile/lib/assets/image/seat/$_selectedSeatType.png"),
              ),
            ),
          ),
          Container(
            child: Text("This seat id is $_selectedSeatId"),
          ),
          Container(
            child: Text("This seat is in $_selectedSeatPosition"),
          ),
          Container(
            child: Text("The avaliable time is $_selectedSeatAvailableTime"),
          ),
          DropdownButton<int>(
            value: _selectedId,
            icon: Icon(
              Icons.expand_more,
              size: 20,
            ),
            items: _buildItems(),
            onChanged: (v) =>setState(() {
              _selectedId = v??0;
              _selectedSeatType = _seatList[_selectedId]["seatType"];
              _selectedSeatId = _seatList[_selectedId]["seatId"];
              _selectedSeatPosition = _seatList[_selectedId]["seatPosition"];
              _selectedSeatAvailableTime = _seatList[_selectedId]["seatAvailableTime"];
            }),
          ),
          Expanded(child: Container(
            child: Center(
              child: ElevatedButton.icon(
                onPressed:() {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) {
                      return BookingSeatStepThreePage(title: "Step 3", seatId: _selectedSeatId, arriveTime: arrivetime);
                    },
                  ));
                  },
                icon: Icon(Icons.add_circle_outline),
                label: Text("Submit your choice!"),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
  List<DropdownMenuItem<int>> _buildItems() => _seatIndexList.map((e) => DropdownMenuItem<int>(value: e,
      child: Text("Available number : $e"),
  )).toList();
}