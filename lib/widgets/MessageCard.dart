import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class MyMessageCard extends StatefulWidget {
  const MyMessageCard({Key? key, required this.messageId}) : super(key: key);

  final int messageId;

  @override
  State<MyMessageCard> createState() => _MyMessageCardState(messageId);
}

class _MyMessageCardState extends State<MyMessageCard> {
  int _messageId;
  _MyMessageCardState(this._messageId);

  Map<String,dynamic> _datamap = {};
  int _imageId = 1;
  int _receiverId = 1;
  String _header = "";
  String _sender = "";
  String _snapshot = "";
  String _sendTime = "";
  @override
  void initState() {
    super.initState();
    this._getData();
  }
  void _getData() async{
    try {
      Response response = await Dio().get('http://localhost:8080/message/$_messageId');
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._datamap = data["data"];
        this._imageId = this._datamap["imageId"];
        this._receiverId = this._datamap["receiverId"];
        this._header = this._datamap["header"];
        this._sender = this._datamap["sender"];
        this._snapshot = this._datamap["snapshot"];
        this._sendTime = this._datamap["sendTime"];
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
              //头像
              child: Image.asset("/Users/gengyuliu/StudioProjects/demo_ksl_mobbile/lib/assets/image/message/$_imageId.jpg",fit: BoxFit.fill,width: 80,
                height: 80,),
            ),
            Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text(_header,style: TextStyle(fontSize: 25)),
                      Text("from:"+_sender),
                      Text(_snapshot),
                    ],
                  ),
                ),
            ),
            Container(
              child: Text(_sendTime),
            )
          ],
        ),
      ),
    );
  }
}
