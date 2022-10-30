import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:demo_ksl_mobbile/widgets/EventInfoCard.dart';
import 'package:demo_ksl_mobbile/widgets/NavBar.dart';
import 'package:demo_ksl_mobbile/widgets/Searcher.dart';
import 'package:demo_ksl_mobbile/widgets/Swiper.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {

  final String title;

  _MyHomePageState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: title,
      ),
      body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child:Container(
                  width: 400,
                  height: 400,
                  child: MySwiper(),
                )
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed:() {},
                icon: Icon(Icons.book_outlined),
                label: Text("Booking a seat!"),
              ),
            ),
            const Center(
              child: MySearch(),
            ),
            SizedBox(
              height: 400,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                children: [
                  Center(
                    child: Container(
                      child: MyEventInfoCard(),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: MyEventInfoCard(),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: MyEventInfoCard(),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: MyEventInfoCard(),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: MyEventInfoCard(),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: MyEventInfoCard(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      bottomNavigationBar: MyNavBar(),
    );
  }
}
