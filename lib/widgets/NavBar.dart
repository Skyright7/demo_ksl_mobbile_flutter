import 'package:flutter/material.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {

  int _selectedIndex = 0;
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
    setState(() {
      _selectedIndex = index;
    });
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
