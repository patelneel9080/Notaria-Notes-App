import 'package:flutter/material.dart';

class MyApptwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinned Security App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PinnedSecurityHomePage(),
    );
  }
}

class PinnedSecurityHomePage extends StatefulWidget {
  @override
  _PinnedSecurityHomePageState createState() => _PinnedSecurityHomePageState();
}

class _PinnedSecurityHomePageState extends State<PinnedSecurityHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Text('Work'),
    Text('Personal'),
    Text('Others'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinned Security App'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Work',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Others',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}