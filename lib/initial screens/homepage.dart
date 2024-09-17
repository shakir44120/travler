import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travler/bottom%20navigation/Booking_page.dart';
import 'package:travler/bottom%20navigation/saved_screen.dart';
import 'package:travler/bottom%20navigation/searchscreen.dart';
import 'package:travler/bottom%20navigation/signin_screensection.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  // This function is triggered when the user taps on one of the bottom navigation items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of widgets that will be displayed for each selected index
  static const List<Widget> _widgetOptions = <Widget>[
    search_Screen(),
    SavedScreen(),
    Booking_page(),
    signin_Screensection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Keeps all buttons visible
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bagShopping),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.circleUser),
            label: 'Sign In',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Color of the selected item
        unselectedItemColor: Colors.grey, // Color of the unselected items
        onTap: _onItemTapped, // Triggered when a button is tapped
      ),
    );
  }
}
