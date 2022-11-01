import 'package:flutter/material.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key, required this.myNavIndex}) : super(key: key);

  final int myNavIndex;

  @override
  State<MyNavBar> createState() => _MyNavBarState(myNavIndex);
}

class _MyNavBarState extends State<MyNavBar> {
  int _selectedIndex;
  _MyNavBarState(this._selectedIndex);
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Busy Map',
      style: optionStyle,
    ),
    Text(
      'Index 2: Scanner',
      style: optionStyle,
    ),
    Text(
      'Index 3: Message',
      style: optionStyle,
    ),
    Text(
      'Index 4: User',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    var preIndex = _selectedIndex;
    setState(() {
      _selectedIndex = index;
    });
    if(preIndex != _selectedIndex){
      if(_selectedIndex == 0){
        Navigator.pushNamed(context, "/",arguments:{'title': 'Flutter Demo Home Page',"myNavIndex":0});
      }
      else if(_selectedIndex == 1){
        Navigator.pushNamed(context, "/busyMap",arguments:{'title': "Busy Page","navIndex":1});
      }
      else if(_selectedIndex == 2){
        Navigator.pushNamed(context, "/scanner",arguments:{'title': "Scanner Page","myNavIndex":2});
      }
      else if(_selectedIndex == 3){
        Navigator.pushNamed(context, "/messagePage",arguments:{'title': "Message Page","myNavIndex":3});
      }
      else if(_selectedIndex == 4){
        Navigator.pushNamed(context, "/userPage",arguments:{'title': "User Page","myNavIndex":4});
      }

    }
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Color.fromARGB(255, 10, 48, 78),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Busy Map',
          backgroundColor: Color.fromARGB(255, 10, 48, 78),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'Scanner',
          backgroundColor: Color.fromARGB(255, 10, 48, 78),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Message',
          backgroundColor: Color.fromARGB(255, 10, 48, 78),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'User',
          backgroundColor: Color.fromARGB(255, 10, 48, 78),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
