import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travler/expendible%20button/update_preferences.dart';

class ExpandableContainer extends StatefulWidget {
  const ExpandableContainer({super.key});

  @override
  ExpandableContainerState createState() => ExpandableContainerState();
}

class ExpandableContainerState extends State<ExpandableContainer> {
  bool isExpanded = false;
  final double collapsedHeight = 65;
  final double expandedHeight = 170.0; // Fully open height

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: isExpanded ? expandedHeight : collapsedHeight,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * .04, top: height * .025),
                        child: const FaIcon(
                          FontAwesomeIcons.circleInfo,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * .02, top: height * .025),
                        child:
                        const Text('Manage personalized recommendations'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * .01, top: height * .025),
                        child: Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up_outlined
                              : Icons.keyboard_arrow_down_outlined,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width * .06, top: height * .03),
                                  child: const Text(
                                      'We provide personalized recommendations based on your activity on our platform.'),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width * .06, top: height * .02),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation, secondaryAnimation) => const PersonalizedRecommendations(),
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
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Update preferences',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
