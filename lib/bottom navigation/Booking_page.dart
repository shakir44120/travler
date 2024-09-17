import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travler/bookings%20screen/active_screen.dart';
import 'package:travler/bookings%20screen/canceled_page.dart';
import 'package:travler/bookings%20screen/past_screen.dart';

class Booking_page extends StatefulWidget {
  const Booking_page({super.key});

  @override
  State<Booking_page> createState() => _Booking_pageState();
}

class _Booking_pageState extends State<Booking_page> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BOOKINGS',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.solidCircleQuestion,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Define what happens when the question mark icon is pressed
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.plus,
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
              Tab(text: 'Active'),
              Tab(text: 'Past'),
              Tab(text: 'Canceled'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            active_screen(),
            past_page(),
            canceled_page(),
          ],
        ),
      ),
    );
  }
}
