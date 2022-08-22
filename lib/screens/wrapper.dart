import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherapp/screens/home.dart';

import 'package:weatherapp/screens/locationscreen.dart';

class Wrapper extends StatefulWidget {
  final locationweather;

  const Wrapper({this.locationweather, Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    // this list is to put screens here

    Home(),
    const LocationScreen(),
    const Text("dem"),
  ];
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.locationweather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int mytappedindex) {
          setState(() {
            //when pressed it gives vibration feedbacks.
            HapticFeedback.lightImpact();
            _currentIndex = mytappedindex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: "weather",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          )
        ],
      ),
      //changes the body of the scaffold with respect to the current
      body: _screens.elementAt(_currentIndex),
    );
  }
}
