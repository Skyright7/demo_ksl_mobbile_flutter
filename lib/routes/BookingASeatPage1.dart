import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:flutter/material.dart';

class BookingSeatStepOnePage extends StatefulWidget {
  const BookingSeatStepOnePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BookingSeatStepOnePage> createState() => _BookingSeatStepOnePageState(title);
}
//记得定制一下appbar，这样可以不加入navbar
class _BookingSeatStepOnePageState extends State<BookingSeatStepOnePage> {

  final String title;

  _BookingSeatStepOnePageState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title,),
      body: Column(
        children: [
          Container(
            child: Text("Please fill in the form below",style: TextStyle(fontSize: 25)),
          ),
          Expanded(
              child: Column(
                children: [
                  Text("here input arrive time"),
                  Text("Here put the desired floor"),
                  Text("Here put the desired area"),
                  Container(
                    child: Center(
                      child: ElevatedButton.icon(
                        onPressed:() {
                          Navigator.pushNamed(context, "/BookingASeat/2",arguments:{'title': "Step Two"});
                        },
                        icon: Icon(Icons.add_circle_outline),
                        label: Text("Submit your choice!"),
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
