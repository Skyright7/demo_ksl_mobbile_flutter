import 'package:demo_ksl_mobbile/routes/BookingASeatPage2.dart';
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

  Map<String,dynamic> _datamap = {};

  int _arriveTime = 23;

  String _floor = "";

  String _area = "";

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
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "Arrive time",
                        hintText: "Please input your desired arrive time here(9-23)",
                        prefixIcon: Icon(Icons.timer),
                    ),
                    onChanged: (text){
                      this._arriveTime = int.parse(text);
                    },
                  ),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "Floor",
                        hintText: "Please input your desired floor here(f1-f3)(optional)",
                        prefixIcon: Icon(Icons.short_text_sharp)
                    ),
                    onChanged: (text){
                      this._floor = text;
                    },
                  ),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "Area",
                        hintText: "Please input your desired area here(d1-d5)(optional)",
                        prefixIcon: Icon(Icons.area_chart_outlined)
                    ),
                    onChanged: (text){
                      this._area = text;
                    },
                  ),
                  Container(
                    child: Center(
                      child: ElevatedButton.icon(
                        onPressed:() {
                          this._datamap["arrivingTime"] = this._arriveTime;
                          this._datamap["preferredArea"] = this._area;
                          this._datamap["preferredFloor"] = this._floor;
                          Navigator.push(context,MaterialPageRoute(
                              builder: (context) {
                            return BookingSeatStepTwoPage(
                              title: "Step 2",
                              dataMap: _datamap,
                            );
                          },
                          ));
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
