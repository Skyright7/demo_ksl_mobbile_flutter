import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:flutter/material.dart';

class BookingSeatStepThreePage extends StatefulWidget {
  const BookingSeatStepThreePage({Key? key, required this.title, required this.seatId, required this.arriveTime}) : super(key: key);

  final String title;

  final int seatId;

  final int arriveTime;

  @override
  State<BookingSeatStepThreePage> createState() => _BookingSeatStepThreePageState(title,seatId,arriveTime);
}
//记得定制一下appbar，这样可以不加入navbar
class _BookingSeatStepThreePageState extends State<BookingSeatStepThreePage> {

  final String title;

  final int _seatId;

  final int _arriveTime;

  _BookingSeatStepThreePageState(this.title, this._seatId, this._arriveTime);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title,),
      body: Column(
        children: [
          Container(
            child: Text("Please Confirm your order detail and choose one finish time:",style: TextStyle(fontSize: 25)),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  child: Text("Your seat Floor is:  F3"),
                ),
                Container(
                  child: Text("Your seat Area is:  D5"),
                ),
                Container(
                  child: Text("Your seat Type is:  2 type"),
                ),
                Container(
                  child: Text("Arrive time: $_arriveTime"),
                ),
                Container(
                  child: Text("Seat id: $_seatId"),
                ),
                Container(
                  child: Text("Below is the image of your seat:"),
                ),
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Center(
                    child: Container(
                      child: Text("这里放这个seat的照片",style: TextStyle(fontSize: 20)),
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  child: Text("Your order date is: 2022/11/11"),
                ),
                Container(
                  child: Text("Your arriving time is: 9am"),
                ),
                Container(
                  child: Text("Please choose your end time here:"),
                ),
                Expanded(child: Container(
                  child: Center(
                    child: ElevatedButton.icon(
                      onPressed:() {
                        Navigator.pushNamed(context, "/success",arguments:{'title': "Booking Suceessful!"});
                      },
                      icon: Icon(Icons.add_circle_outline),
                      label: Text("Finish and Submit your choice!"),
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}