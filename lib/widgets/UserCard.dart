import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';

class MyUserCard extends StatefulWidget {
  const MyUserCard({Key? key}) : super(key: key);

  //假设拆好包了

  @override
  State<MyUserCard> createState() => _MyUserCardState();
}

class _MyUserCardState extends State<MyUserCard> {

  String userName = "Rain";

  String userAvatarUrl = "https://via.placeholder.com/350x150";

  String userTitle = "Win le";

  String userShortInfo = "Graduate degree CS student";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(userAvatarUrl),
                backgroundColor: Colors.white,
              ),
            ),
            Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Text(userName),
                      Text(userShortInfo),
                      Text(userTitle),
                    ],
                  ),
                ),
            ),
            Container(
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        child: Icon(Icons.more),
                      ),
                  ),
                  Container(
                    child: Text("More Info"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
