import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:dio/dio.dart';
import 'dart:convert'; //格式转换包

class MySwiper extends StatefulWidget {
  const MySwiper({Key? key}) : super(key: key);

  @override
  State<MySwiper> createState() => _MySwiperState();
}

class _MySwiperState extends State<MySwiper> {
  List<dynamic> _datamap = [];
  @override
  void initState() {
    super.initState();
    this._getData();
  }
  void _getData() async{
    try {
      Response response = await Dio().get('http://localhost:8080/swiper');
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._datamap = data["data"];
      });
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        final item = _datamap[index];
        final int imageNum = item["imageId"];//这里的读取图片文件后续会换成读取cdn文件
        return Image.asset("/Users/gengyuliu/StudioProjects/demo_ksl_mobbile/lib/assets/image/swiper/$imageNum.jpg");
      },
      itemCount: _datamap.length,
      itemWidth: 300.0,
      layout: SwiperLayout.STACK,
      );
  }
}






