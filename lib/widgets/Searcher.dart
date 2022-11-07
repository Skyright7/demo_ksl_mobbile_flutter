import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';

class MySearch extends StatefulWidget {
  const MySearch({Key? key}) : super(key: key);

  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: BrnSearchText(
        innerPadding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        maxHeight: 60,
        innerColor: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        normalBorder:
          Border.all(color: Color(0xFFF0F0F0), width: 1, style: BorderStyle.solid),
        activeBorder:
          Border.all(color: Color(0xFF0984F9), width: 1, style: BorderStyle.solid),
        autoFocus: false,
        action: Container(),
        onActionTap: () {
          BrnToast.show('取消', context);
        },
        onTextCommit: (text) {
          BrnToast.show('提交内容 : $text', context);
        },
        onTextChange: (text) {
          BrnToast.show('输入内容 : $text', context);
        },
      ),
    );
  }
}
