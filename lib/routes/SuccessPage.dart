import 'package:flutter/material.dart';
import 'package:demo_ksl_mobbile/widgets/AppBar.dart';

class SuccessPage extends StatelessWidget {
  
  final String title;
  
  
  const SuccessPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title,),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Container(
              color: Colors.green,
              child: Center(
                child: Container(
                  child: Text("Congraduations! Your order is Success!",style: TextStyle(fontSize: 26)),
                ),
              ),
            ),
          ),
          Container(
            child: Text("下面放一些订单详情信息啥的",style: TextStyle(fontSize: 26)),
          ),
          Expanded(child: Container(
            child: Center(
              child: ElevatedButton.icon(
                onPressed:() {
                  Navigator.pushNamed(context, "/",arguments:{'title': 'Flutter Demo Home Page',"myNavIndex":0});
                },
                icon: Icon(Icons.home),
                label: Text("Finish and Back to HomePage!"),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
