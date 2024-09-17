import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travler/api%20section/CarRental_search.dart';
import 'package:travler/expendible%20button/expandable_container.dart';

class car_rentalscreen extends StatefulWidget {
  const car_rentalscreen({super.key});

  @override
  State<car_rentalscreen> createState() => _car_rentalscreenState();
}

class _car_rentalscreenState extends State<car_rentalscreen> {
  bool isReturnSameLocation = false; // Toggle button state

  String _getCurrentDate() {
    final DateTime now = DateTime.now();
    return DateFormat('MMM dd, yyyy').format(now);
  }

  String _getTwoDaysLaterDate() {
    final DateTime twoDaysLater = DateTime.now().add(const Duration(days: 2));
    return DateFormat('MMM dd, yyyy').format(twoDaysLater);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ],
                    border: Border.all(width: 5.0, color: Colors.blue)),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Return to Same Location Container
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Return to the same location',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Switch(
                          value: isReturnSameLocation,
                          onChanged: (value) {
                            setState(() {
                              isReturnSameLocation = value;
                            });
                          },
                          activeColor: Colors.blue,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Divider(thickness: 5, color: Colors.blue),

                    // Location Container
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.car_rental, color: Colors.blue),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'pick up location',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 4, color: Colors.blue),

                    // Date Container
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.calendar_today, color: Colors.blue),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '${_getCurrentDate()} - ${_getTwoDaysLaterDate()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 4, color: Colors.blue),

                    // Room and Guests Info
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.person, color: Colors.blue),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Driver age:30-35',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 4, color: Colors.blue),

                    // Search Button
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                              const CarRentalSearch(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const curve = Curves.easeInOut;
                                final offsetAnimation = Tween<Offset>(
                                    begin: const Offset(1.0, 0.0),
                                    end: Offset.zero)
                                    .animate(
                                  CurvedAnimation(
                                    parent: animation,
                                    curve: curve,
                                  ),
                                );
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                              transitionDuration:
                              const Duration(milliseconds: 500),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  left: width * .035, top: height * .01, bottom: height * .01),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'More for you',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width*.028,right: width*.01),
                      child: Container(
                        height: height * .4,
                        width: width * .95,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                                15.0), // Radius of the rounded corners
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:
                              Colors.black.withOpacity(0.5), // Shadow color
                              spreadRadius: .5, // Spread radius
                              blurRadius: 5, // Blur radius
                              offset: const Offset(
                                  0, 2), // Offset in the x and y directions
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          child: Image.asset(
                            'images/travel.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * .34,
                      left: width * .035,
                      child: const Text(
                        'Travel Articles',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: height * .04, bottom: height * .03),
              child: const ExpandableContainer(),
            ),
          )
        ],
      ),
    );
  }
}
