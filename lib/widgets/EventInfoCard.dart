import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class MyEventInfoCard extends StatefulWidget {
  const MyEventInfoCard({Key? key, required this.eventId}) : super(key: key);

  final int eventId;

  @override
  State<MyEventInfoCard> createState() => _MyEventInfoCardState(eventId);
}

class _MyEventInfoCardState extends State<MyEventInfoCard> {
  int _eventId;
  _MyEventInfoCardState(this._eventId);

  Map<String,dynamic> _datamap = {};
  int _imageId = 1;
  String _header = "";
  String _snapshot = "";
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
        this._imageId = this._datamap["imageId"];
        this._header = this._datamap["header"];
        this._snapshot = this._datamap["snapshot"];
        this._holdTime = this._datamap["holdTime"];
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
              child: Image.asset("/Users/gengyuliu/StudioProjects/demo_ksl_mobbile/lib/assets/image/event/$_imageId.jpg",fit: BoxFit.fill,width: 80,
                height: 80,),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text(_header,style: TextStyle(fontSize: 25)),
                    Text(_snapshot),
                    Text("Hold on:" + _holdTime),
                  ],
                ),
              ),
            ),
            Container(
              child: Icon(Icons.open_in_full_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
