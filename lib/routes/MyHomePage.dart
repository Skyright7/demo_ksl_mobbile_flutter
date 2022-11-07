import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:demo_ksl_mobbile/widgets/EventInfoCard.dart';
import 'package:demo_ksl_mobbile/widgets/NavBar.dart';
import 'package:demo_ksl_mobbile/widgets/Searcher.dart';
import 'package:demo_ksl_mobbile/widgets/Swiper.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.myNavIndex});

  final String title;

  final int myNavIndex;

  @override
  State<MyHomePage> createState() => _MyHomePageState(title,myNavIndex);
}

class _MyHomePageState extends State<MyHomePage> {

  final String title;
  final int myNavIndex;

  _MyHomePageState(this.title,this.myNavIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: title,
      ),
      body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
             Container(
                  width: 300,
                  height: 200,
                  child: MySwiper(),
                ),
            Container(
              child: Center(
                child: ElevatedButton.icon(
                  onPressed:() {
                    Navigator.pushNamed(context, "/BookingASeat/1",arguments:{'title': "Step one of Booking A Seat"});
                  },
                  icon: Icon(Icons.book_outlined),
                  label: Text("Booking a seat!"),
                ),
              ),
            ),
            Container(
              child: Center(
                child: MySearch(),
              ),
            ),
            Expanded(
                child: SizedBox(
                  height: 400,
                  child: ListView.builder(
                      itemCount: 10,
                      prototypeItem: MyEventInfoCard(),
                      itemBuilder: (context, index){
                        return MyEventInfoCard();
                      },
                  ),
                ),
            ),
          ],
        ),
      bottomNavigationBar: MyNavBar(myNavIndex: myNavIndex,),
    );
  }
}
