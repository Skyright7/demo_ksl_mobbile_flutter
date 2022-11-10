import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


class MessageDetailPage extends StatefulWidget {
  const MessageDetailPage({Key? key, required this.messageId}) : super(key: key);

  final int messageId;

  @override
  State<MessageDetailPage> createState() => _MessageDetailPageState(messageId);
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  final int _messageId;
  _MessageDetailPageState(this._messageId);

  Map<String,dynamic> _datamap = {};
  String _header = "";
  String _sender = "";
  String _sendTime = "";
  String _detail = "";
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
        this._header = this._datamap["header"];
        this._sender = this._datamap["sender"];
        this._detail = this._datamap["detail"];
        this._sendTime = this._datamap["sendTime"];
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
            child: Center(child: Text(_header,style: TextStyle(fontSize: 30),),),
          ),
          Container(
            child: Center(child: Text("Send time: "+ _sendTime+" From: "+_sender),),
          ),
          Expanded(child: Container(
            child: Text(_detail,style: TextStyle(fontSize: 20),),
          ))
        ],
      ),
    );
  }
}
