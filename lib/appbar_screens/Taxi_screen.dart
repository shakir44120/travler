import 'package:flutter/material.dart';
import 'package:travler/api%20section/Taxi_search.dart';
import 'package:travler/expendible%20button/expandable_container.dart';

class TaxiScreen extends StatefulWidget {
  const TaxiScreen({super.key});

  @override
  State<TaxiScreen> createState() => _TaxiScreenState();
}

class _TaxiScreenState extends State<TaxiScreen> {
  bool isOneWay = true; // State to manage whether "One-Way" or "Round Trip" is selected

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
                  border: Border.all(width: 5.0, color: Colors.blue),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // One-Way and Round Trip Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isOneWay = true; // Select One-Way
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: isOneWay ? Colors.blue : Colors.grey,
                                size: 12,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'One-Way',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 60),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isOneWay = false; // Select Round Trip
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: !isOneWay ? Colors.blue : Colors.grey,
                                size: 12,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Round Trip',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // Spacing before next section
                    const Divider(thickness: 4, color: Colors.blue),

                    // Enter pick-up location
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.blue),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Enter pick-up location',
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
                    const Divider(thickness: 1, color: Colors.grey),

                    // Enter destination
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.blue),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Enter destination',
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

                    // Choose pick-up time
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.timer, color: Colors.blue),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Choose your pick-up time',
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
                              const Taxi_Search(),
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
