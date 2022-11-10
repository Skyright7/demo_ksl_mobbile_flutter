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
        child: Icon(Icons.account_circle,color: Color.fromARGB(255, 10, 48, 78),),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
//这个后续要换成自己的appbar