import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({Key? key, required this.eventId}) : super(key: key);

  final int eventId;


  @override
  State<EventDetailPage> createState() => _EventDetailPageState(eventId);
}

class _EventDetailPageState extends State<EventDetailPage> {



  final int _eventId;

  _EventDetailPageState(this._eventId);

  Map<String,dynamic> _datamap = {};
  String _header = "";
  String _detail = "";
  String _holdTime = "";
  @override
  void initState() {
    super.initState();
    this._getData();
  }
  void _getData() async{
    try {
      Response response = await Dio().get('http://localhost:8080/event/$_eventId');
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._datamap = data["data"];
        this._header = this._datamap["header"];
        this._detail = this._datamap["detail"];
        this._holdTime = this._datamap["holdTime"];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: _header,),
      body: Column(
        children: [
          Container(
            child: Text(_header,style: TextStyle(fontSize: 30),),
          ),
          Container(
            child: Text("Hold time: "+ _holdTime),
          ),
          Expanded(child: Container(
            child: Text(_detail,style: TextStyle(fontSize: 20),),
          ))
        ],
      ),
    );
  }
}
