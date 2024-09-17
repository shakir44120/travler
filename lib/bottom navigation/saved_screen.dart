import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
        // Add both the question mark and plus icons on the right side
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.solidCircleQuestion,color: Colors.white,),
              onPressed: () {
                // Define what happens when the question mark icon is pressed
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.plus,color: Colors.white,),
              onPressed: () {
                // Define what happens when the plus icon is pressed
              },
            ),
          ),
        ],
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const Padding(
           padding: EdgeInsets.only(top: 30 ,bottom: 30,left: 10,),
           child: SizedBox(
             height: 150,
             width: 150,
             child:Image(image: AssetImage('images/save.png'))
           ),
         ),
          // Text 'Save you later'
        const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Row(
              children: [
                Text(textAlign: TextAlign.center,
                  'Save what you like for later',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // SizedBox for spacing
          const SizedBox(height: 5),

          // Text 'Create your list'
       const Padding(
          padding:  EdgeInsets.only(bottom: 10,left: 5),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [

                   Text(textAlign: TextAlign.center,
                      'Create lists of your favorite properties to help you share, compare and book.',
                      style: TextStyle(fontSize: 18),
                    ),
             ],
           ),
        ),

          // SizedBox for spacing before the button
          const SizedBox(height: 10),

          // 'Create List' button

          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              side: const BorderSide(color: Colors.blue, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(13),
            ),
            child: const Text(
              'Start your search',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),
            ),
          ),


          // SizedBox for spacing before text button
          const SizedBox(height: 5),

          // Text button
          Padding(
            padding: const EdgeInsets.only(bottom: 120
            ),
            child: TextButton(
              onPressed: () {
                // Define what happens when the text button is pressed
              },
              child: const Text('Create a List'),
            ),
          ),
        ],
      ),
    );
  }
}
