import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:flutter/material.dart';

class BookingSeatStepTwoPage extends StatefulWidget {
  const BookingSeatStepTwoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BookingSeatStepTwoPage> createState() => _BookingSeatStepTwoPageState(title);
}
//记得定制一下appbar，这样可以不加入navbar
class _BookingSeatStepTwoPageState extends State<BookingSeatStepTwoPage> {

  final String title;

  _BookingSeatStepTwoPageState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title,),
      body: Column(
        children: [
          Container(
            child: Text("Please Choose one seat from the diagram below",style: TextStyle(fontSize: 25)),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Center(
                    child: Container(
                      child: Text("这里放可视化的选择图",style: TextStyle(fontSize: 20)),
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(child: Container(
                  child: Center(
                    child: ElevatedButton.icon(
                      onPressed:() {
                        Navigator.pushNamed(context, "/BookingASeat/3",arguments:{'title': "Step Three"});
                      },
                      icon: Icon(Icons.add_circle_outline),
                      label: Text("Submit your choice!"),
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