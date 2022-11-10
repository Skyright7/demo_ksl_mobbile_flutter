import 'package:demo_ksl_mobbile/routes/UserDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class MyUserCard extends StatefulWidget {
  const MyUserCard({Key? key, required this.userId}) : super(key: key);

  final int userId;

  @override
  State<MyUserCard> createState() => _MyUserCardState(userId);
}

class _MyUserCardState extends State<MyUserCard> {

  String _userName = "";

  String _userPreferredName = "";

  String _userMajor = "";

  int _userGraduationYear = 2000;

  int _userAvatar = 1;

  String _userTitle = "";


  Map<String,dynamic> _datamap = {};

  final int userId;

  _MyUserCardState(this.userId);

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() async{
    try {
      Response response = await Dio().get('http://localhost:8080/user/$userId');
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._datamap = data["data"];
        this._userName = this._datamap["userName"];
        this._userPreferredName = this._datamap["userPreferredName"];
        this._userMajor = this._datamap["userMajor"];
        this._userGraduationYear = this._datamap["userGraduationYear"];
        this._userAvatar = this._datamap["userAvatar"];
        this._userTitle = this._datamap["userTitle"];
      });
    } catch (e) {
      print(e);
    }
  }

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
                backgroundImage: AssetImage("/Users/gengyuliu/StudioProjects/demo_ksl_mobbile/lib/assets/image/avatar/$_userAvatar.jpeg"),
                backgroundColor: Colors.white,
              ),
            ),
            Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Expanded(child: Text(_userName,style: TextStyle(fontSize: 25),),),
                      Text("Prefer Name:"+_userPreferredName),
                      Text("$_userGraduationYear year,"+_userMajor+" major student"),
                      Text(_userTitle),
                    ],
                  ),
                ),
            ),
            Container(
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        child: IconButton(
                          icon: Icon(Icons.more),
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(
                              builder: (context) {
                                return UserDetailPage(
                                  userId: userId,
                                );
                              },
                            ),
                            );
                          },
                        ),
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
