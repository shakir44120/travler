import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travler/signin_screen/signin_screen.dart';

class signin_Screensection extends StatelessWidget {
  const signin_Screensection({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: FaIcon(FontAwesomeIcons.solidCircleQuestion,color: Colors.white,size: 27),
          ),
        ],
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.blueAccent,
              width: width,
              height: height*.31,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                        height: height*.15,
                        width: width*.15,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade600,
                            shape: BoxShape.circle
                        ),
                        child: const Center(child: FaIcon(FontAwesomeIcons.user,color: Colors.white,size: 27))
                    ),
                  ),
                  SizedBox(
                    width: width*.7,
                    child: const Text(
                      'Sign in to see deals and Genius discounts, manage your trips and more',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height*.02,bottom: height*.01),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => const SignInScreen(),
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
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blueAccent.shade700,
                            side: const BorderSide(color: Colors.blue, width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(10),
                          ),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: width*.05,right: width*.05,top: height*.02),
                child: Column(
                  children: [
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.arrowRightFromBracket,color: Colors.grey.shade600,size: 18),
                        Padding(
                          padding: EdgeInsets.only(left: width*.04),
                          child: const Text(
                            'Sign in or create account',
                            style: TextStyle(
                                fontSize: 12
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.wallet,color: Colors.grey.shade600,size: 18),
                          Padding(
                            padding: EdgeInsets.only(left: width*.04),
                            child: const Text(
                              'Rewards & Wallet',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.g,color: Colors.grey.shade600,size: 18),
                          Padding(
                            padding: EdgeInsets.only(left: width*.04),
                            child: const Text(
                              'Genius loyalty program',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.thumbsUp,color: Colors.grey.shade600,size: 18),
                          Padding(
                            padding: EdgeInsets.only(left: width*.04),
                            child: const Text(
                              'Reviews',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.question,color: Colors.grey.shade600,size: 18),
                          Padding(
                            padding: EdgeInsets.only(left: width*.04),
                            child: const Text(
                              'Questions to properties',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width*.02),
                            child: const Text(
                              'Help and support',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.circleQuestion,color: Colors.grey.shade600,size: 18),
                          Padding(
                            padding: EdgeInsets.only(left: width*.04),
                            child: const Text(
                              'Contact Customer Service',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.circleH,color: Colors.grey.shade600,size: 18),
                          Padding(
                            padding: EdgeInsets.only(left: width*.04),
                            child: const Text(
                              'Safety Resource Center',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.handshake,color: Colors.grey.shade600,size: 18),
                          Padding(
                            padding: EdgeInsets.only(left: width*.04),
                            child: const Text(
                              'Dispute resolution',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width*.02),
                            child: const Text(
                              'Discover',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.percent,color: Colors.grey.shade600,size: 18),
                          Padding(
                            padding: EdgeInsets.only(left: width*.04),
                            child: const Text(
                              'Deals',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.plane,color: Colors.grey.shade600,size: 18),
                          Padding(
                            padding: EdgeInsets.only(left: width*.04),
                            child: const Text(
                              'Airport taxis',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.newspaper,color: Colors.grey.shade600,size: 18),
                          Padding(
                            padding: EdgeInsets.only(left: width*.04),
                            child: const Text(
                              'Travel articles',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width*.02),
                            child: const Text(
                              'Settings and legal',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          Icon(Icons.settings_outlined,color: Colors.grey.shade600,size: 18,),
                          Padding(
                            padding: EdgeInsets.only(left: width*.04),
                            child: const Text(
                              'Settings',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width*.02),
                            child: const Text(
                              'Partners',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*.03,bottom: height*.03),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.house,color: Colors.grey.shade600,size: 18),
                          Padding(
                            padding: EdgeInsets.only(left: width*.04),
                            child: const Text(
                              'List your property',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
