import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  const MyAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BrnAppBar(
      title: title,
      automaticallyImplyLeading: true,
      actions: BrnIconAction(
        iconPressed: () {},
        child: Image.asset(
          '/Users/gengyuliu/StudioProjects/demo_ksl_mobbile/lib/assets/image/images.jpeg',
          scale: 3.0,
          height: 20,
          width: 20,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
