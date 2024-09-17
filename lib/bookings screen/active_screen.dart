import 'package:flutter/material.dart';
import 'package:travler/signin_screen/signin_screen.dart';

class  active_screen extends StatelessWidget {
  const active_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30 ,bottom: 30,left: 10,),
            child: SizedBox(
                height: 190,
                width: 190,
                child:Image(image: AssetImage('images/globe.png'))
            ),
          ),
          // Text 'Save you later'
          const Padding(
            padding: EdgeInsets.only(left: 120),
            child: Row(
              children: [
                Text(textAlign: TextAlign.center,
                  'No bookings yet',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // SizedBox for spacing
          const SizedBox(height: 5),

          // Text 'Create your list'
          const Padding(
            padding:  EdgeInsets.only(bottom: 10,left: 10,right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(textAlign: TextAlign.center,
                  'Sign in or create an account to get started.',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),

          // SizedBox for spacing before the button
          const SizedBox(height: 10),

          // 'Create List' button

          Padding(
            padding: const EdgeInsets.only(bottom: 230),
            child: TextButton(
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(
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
                ),);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                side: const BorderSide(color: Colors.blue, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(13),
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
          ),
        ],
      ),
    );
  }
}
