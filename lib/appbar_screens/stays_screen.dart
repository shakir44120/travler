import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travler/api%20section/stays%20screen%20api.dart';
import 'package:travler/expendible%20button/expandable_container.dart';

class StaysScreen extends StatefulWidget {
  const StaysScreen({Key? key}) : super(key: key);

  @override
  State<StaysScreen> createState() => _StaysScreenState();
}

class _StaysScreenState extends State<StaysScreen> {
  // Method to get current and two days later date
  String _getCurrentDate() {
    final DateTime now = DateTime.now();
    return DateFormat('MMM dd, yyyy').format(now);
  }

  String _getTwoDaysLaterDate() {
    final DateTime twoDaysLater = DateTime.now().add(const Duration(days: 2));
    return DateFormat('MMM dd, yyyy').format(twoDaysLater);
  }
  List<String> locationIdeas = [
    'Islamabad',
    'Lahore',
    'Dubai',
    'Karachi',
    'Istanbul',
    'Baku',
    'Medina',
    'Rawalpindi',
    'Kuala Lumpur',
  ];
  final List<String> imagePaths = [
    'images/islamabad.jpg',
    'images/lahore.jpeg',
    'images/dubai.jpg',
    'images/karachi.jpg',
    'images/istanbul.jpg',
    'images/baku.jpg',
    'images/medina.jpg',
    'images/rawalpindi.jpg',
    'images/kualalumpur.jpg',
  ];


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
                  border: Border.all(
                    width: 5.0,color: Colors.blue
                  )
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Location Container
                   const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Icon(Icons.location_on, color: Colors.blue),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    const Divider(thickness: 4,color: Colors.blue,),

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
                    SizedBox(height: 10,),
                    const Divider(thickness: 4,color: Colors.blue,),

                    // Room and Guests Info
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Icon(Icons.people, color: Colors.blue),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '1 room, 2 adults, 3 children',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    const Divider(thickness: 4,color: Colors.blue,),

                    // Search Button
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const StaysApi(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              // Define the animation curve
                              const curve = Curves.easeInOut;
                              // Slide transition
                              final offsetAnimation = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
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
                            transitionDuration: const Duration(milliseconds: 500),
                          ),);
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
              padding: EdgeInsets.only(left: width * .035, top: height * .03),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Need ideas?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Travelers from Pakistan often book',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              height: height * .4,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: locationIdeas.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: height * .04,
                          left: width * .025,
                          right: width * .02),
                      child: Stack(
                        children: [
                          Container(
                            height: height * .45,
                            width: width * .5,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                    10.0), // Radius of the rounded corners
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              child: Image.asset(
                                imagePaths[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: height * .31,
                            left: width * .035,
                            child: Text(
                              locationIdeas[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  left: width * .035, top: height * .07, bottom: height * .02),
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
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * .4,
                        width: width * .45,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15.0), // Radius of the rounded corners
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
                            'images/beach.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: height * .2879,
                        left: width * .023,
                        child: Container(
                          width: width * .45,
                          height: height * .125,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(
                                  15), // Radius of the rounded corners
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * .04, top: height * .02),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Seize the moment',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: width * .04),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Save 15% or more on stays',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: width*0,left: width*.042),
                      child: Container(
                        height: height * .4,
                        width: width * .45,
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
                      top: height * .32,
                      left: width * .07,
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
