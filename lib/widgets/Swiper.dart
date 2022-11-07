import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class MySwiper extends StatefulWidget {
  const MySwiper({Key? key}) : super(key: key);

  @override
  State<MySwiper> createState() => _MySwiperState();
}

class _MySwiperState extends State<MySwiper> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset("/Users/gengyuliu/StudioProjects/demo_ksl_mobbile/lib/assets/image/350x150.png");
        },
        itemCount: 10,
        itemWidth: 300.0,
        layout: SwiperLayout.STACK,
      );
  }
}






