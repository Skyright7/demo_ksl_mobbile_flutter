import 'package:flutter/material.dart';

class MyMessageCard extends StatefulWidget {
  const MyMessageCard({Key? key}) : super(key: key);

  @override
  State<MyMessageCard> createState() => _MyMessageCardState();
}

class _MyMessageCardState extends State<MyMessageCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Container(
              //头像
              child: Image.network("https://via.placeholder.com/350x150",fit: BoxFit.fill,width: 80,
                height: 80,),
            ),
            Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text("This is the header",style: TextStyle(fontSize: 25)),
                      Text("To: who..."),
                      Text("Message deatail shortcut..."),
                    ],
                  ),
                ),
            ),
            Container(
              child: Text("2022/10/12"),
            )
          ],
        ),
      ),
    );
  }
}
