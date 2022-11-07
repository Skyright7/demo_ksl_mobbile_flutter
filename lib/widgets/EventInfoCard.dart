import 'package:flutter/material.dart';

class MyEventInfoCard extends StatefulWidget {
  const MyEventInfoCard({Key? key}) : super(key: key);

  @override
  State<MyEventInfoCard> createState() => _MyEventInfoCardState();
}

class _MyEventInfoCardState extends State<MyEventInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Container(
              child: Image.asset("/Users/gengyuliu/StudioProjects/demo_ksl_mobbile/lib/assets/image/350x150.png",fit: BoxFit.fill,width: 80,
                height: 80,),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text("This is a header.",style: TextStyle(fontSize: 25)),
                    Text("This is a short cut of main info..."),
                    Text("Hold on: 2022/10/30"),
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
