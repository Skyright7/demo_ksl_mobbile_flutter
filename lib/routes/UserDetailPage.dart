import 'package:demo_ksl_mobbile/widgets/AppBar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  State<UserDetailPage> createState() => _UserDetailPageState(userId);
}

class _UserDetailPageState extends State<UserDetailPage> {
  final int _userId;
  _UserDetailPageState(this._userId);

  String _userName = "";

  String _userPreferredName = "";

  String _userMajor = "";

  int _userGraduationYear = 2000;

  int _userAvatar = 1;

  String _userTitle = "";

  String _userCaseId = "";

  String _userEmailAddress = "";

  String _userAddress = "";

  String _userPhoneNumber ="";

  int _userGender = 1;

  String _gender = "";



  Map<String,dynamic> _datamap = {};

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() async{
    try {
      Response response = await Dio().get('http://localhost:8080/user/$_userId');
      this.setState(() {
        Map<String,dynamic> data = json.decode(response.toString());
        this._datamap = data["data"];
        this._userCaseId = this._datamap["userCaseId"];
        this._userName = this._datamap["userName"];
        this._userEmailAddress = this._datamap["userEmailAddress"];
        this._userPreferredName = this._datamap["userPreferredName"];
        this._userAddress = this._datamap["userAddress"];
        this._userPhoneNumber = this._datamap["userPhoneNumber"];
        this._userGender = this._datamap["userGender"];
        this._userMajor = this._datamap["userMajor"];
        this._userGraduationYear = this._datamap["userGraduationYear"];
        this._userAvatar = this._datamap["userAvatar"];
        this._userTitle = this._datamap["userTitle"];
        if(_userGender == 1){
          this._gender = "male";
        }
        else{
          this._gender = "female";
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "User Detail Page",),
      body: Column(
        children: [
          Center(child: Container(
            width: 150,
            height: 150,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("/Users/gengyuliu/StudioProjects/demo_ksl_mobbile/lib/assets/image/avatar/$_userAvatar.jpeg"),
              backgroundColor: Colors.white,
            ),
          ),
          ),
          Container(
            child: Center(child: Text(_userName,style: TextStyle(fontSize: 30),),),
          ),
          Container(
            child: Text("Case Id: " + _userCaseId + " Gender: " + _gender,style: TextStyle(fontSize: 20),),
          ),
          Container(
            child: Text("Preferred Name: " + _userPreferredName + "Email address: " + _userEmailAddress,style: TextStyle(fontSize: 20),),
          ),
          Container(
            child: Text("User Address is: " + _userAddress,style: TextStyle(fontSize: 20),),
          ),
          Container(
            child: Text("PhoneNumber : " + _userPhoneNumber,style: TextStyle(fontSize: 20),),
          ),
          Container(
            child: Text("You are a " + _userMajor+" Student, And will graduate at $_userGraduationYear Year.",style: TextStyle(fontSize: 20),),
          ),
          Container(
            child: Text("Your Personal Title is: " + _userTitle,style: TextStyle(fontSize: 25),),
          ),
        ],
      ),
    );
  }
}
