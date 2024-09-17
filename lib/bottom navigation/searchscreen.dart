import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travler/appbar_screens/Attraction_Screen.dart';
import 'package:travler/appbar_screens/CarRental_screen.dart';
import 'package:travler/appbar_screens/Taxi_screen.dart';
import 'package:travler/appbar_screens/stays_screen.dart';

class search_Screen extends StatelessWidget {
  const search_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'TRAVELER',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.bell,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Define what happens when the plus icon is pressed
                },
              ),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white, // Text color for selected tab
            unselectedLabelColor: Colors.white70, // Text color for unselected tabs
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold, // Make text bold
            ),
            tabs: [
              Tab(text: 'Stays',icon: FaIcon(FontAwesomeIcons.bed),),
              Tab(text: 'CarRental',icon: FaIcon(FontAwesomeIcons.carSide),),
              Tab(text: 'Taxi',icon: FaIcon(FontAwesomeIcons.taxi),),
              Tab(text:'Attractions',icon: Icon(Icons.attractions_outlined),)
            ],
          ),
        ),
        body: const TabBarView(
          children: [
           StaysScreen(),
           car_rentalscreen(),
           TaxiScreen(),
            Attraction_Screen()
              ],
         ),
      ),
    );
  }
}
