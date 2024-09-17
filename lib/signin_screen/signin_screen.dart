import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TRAVELER',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop(_createRoute()); // Use custom animation
          },
        ),
        actions: [
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.solidCircleQuestion,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Sign in for easier access to your trip details',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 40),
            _buildSignInButton(
              icon: FontAwesomeIcons.google,
              text: 'Continue with Google',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderColor: Colors.grey,
              onPressed: () {
                // Add Google sign-in logic here
              },
            ),
            const SizedBox(height: 15),
            _buildSignInButton(
              icon: FontAwesomeIcons.facebook,
              text: 'Continue with Facebook',
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              borderColor: Colors.transparent,
              onPressed: () {
                // Add Facebook sign-in logic here
              },
            ),
            const SizedBox(height: 15),
            _buildSignInButton(
              icon: Icons.email,
              text: 'Continue with Email',
              backgroundColor: Colors.green,
              textColor: Colors.white,
              borderColor: Colors.transparent,
              onPressed: () {
                // Add Email sign-in logic here
              },
            ),
            SizedBox(height:380,),
            const Text(
              'By signing in or creating an account, you agree with',
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: .2,
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  'our',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: .2,
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
                Padding(
                  padding: EdgeInsets.only(left:01),
                  child: const Text(
                    'Terms & Conditions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: .2,
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:01,right:01),
                  child: const Text(
                    'and',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: .2,
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:01),
                  child: const Text(
                    'Privacy Statement',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: .2,
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '2024-2024 TravelPartner',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: .2,
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Build Sign-in Button
  Widget _buildSignInButton({
    required IconData icon,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required Color borderColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: FaIcon(icon, color: textColor),
        label: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(color: borderColor),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: onPressed,
      ),
    );
  }

  // Create custom left-to-right page transition
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const SignInScreenSection(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin =Offset(1.0, 0.0); // From left to right
        const end = Offset(-1.0, 0.0);
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

class SignInScreenSection extends StatelessWidget {
  const SignInScreenSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Section'),
      ),
      body: const Center(
        child: Text('This is the Sign In Section'),
      ),
    );
  }
}
