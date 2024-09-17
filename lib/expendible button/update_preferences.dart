import 'package:flutter/material.dart';

class PersonalizedRecommendations extends StatefulWidget {
  const PersonalizedRecommendations({super.key});

  @override
  State<PersonalizedRecommendations> createState() => _PersonalizedRecommendationsState();
}

class _PersonalizedRecommendationsState extends State<PersonalizedRecommendations> {
  bool isOn = false;

  void toggleButton(bool value) {
    setState(() {
      isOn = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: true,
        title: const Text(
            'Personalized Recommendations',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width*.04,top: height*.03),
            child: Row(
              children: [
                const Text(
                    'Personalized recommendations',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: width*.1,),
                Transform.scale(
                  scale: .8,
                  child: Switch(
                    value: isOn,
                    onChanged: toggleButton,
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey.withOpacity(0.5),
                    splashRadius: 10,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width*.04,top: height*.01),
            child: SizedBox(
              width: width*.8,
              child: const Row(
                children: [
                  Flexible(
                    child: Text(
                      'Keep this option enabled to see the most relevant search results with a better'
                          ' browsing experience. If you disable this feature, your searches will be ranked'
                          ' based on review scores and lowest price.',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.grey
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
