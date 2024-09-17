import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class Taxi_Search extends StatefulWidget {
  const Taxi_Search({super.key});

  @override
  State<Taxi_Search> createState() => _Taxi_SearchState();
}

class _Taxi_SearchState extends State<Taxi_Search> {
  final String apiKey = '39a126ecb2msh9ff90f29f822fd6p19aa71jsnd88ee363dba7';
  final String apiHost = 'booking-com15.p.rapidapi.com';
  List<dynamic> cars = [];
  bool isLoading = false;
  bool hasSearched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search for Taxi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.blueAccent,
        ),
      )
          : hasSearched && cars.isEmpty
          ? const Center(child: Text('No cars found. Please try again.'))
          : !hasSearched
          ? const Center(
        child: Text(
          'Press the search button to load Taxi.',
          style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          final name = car['name'] ?? 'N/A';
          final description = car['label'] ?? 'N/A';
          final type = car['type'] ?? 'N/A';
          final destType = car['dest_type'] ?? 'N/A';
          final region = car['region'] ?? 'N/A';
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.blueAccent,
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Car Name: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            name,
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Description: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            description,
                            style: const TextStyle(
                                fontSize: 15),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Car Type: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            type,
                            style: const TextStyle(
                                fontSize: 15),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Dest Type: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            destType,
                            style: const TextStyle(
                                fontSize: 15),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Region: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          child: Text(
                            region,
                            style: const TextStyle(
                                fontSize: 15),
                            overflow: TextOverflow.visible,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: fetchCars,
        child: const FaIcon(FontAwesomeIcons.magnifyingGlass,
            color: Colors.white),
      ),
    );
  }

  void fetchCars() async {
    setState(() {
      isLoading = true;
      hasSearched = true;
    });

    const url =
        'https://booking-com15.p.rapidapi.com/api/v1/taxi/searchLocation?query=islamabad';
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': apiHost,
    });

    if (response.statusCode == 200) {
      final body = response.body;
      print(body); // Debugging: print the response body to the console

      final jsonResponse = jsonDecode(body);

      setState(() {
        cars = jsonResponse['data'] ?? []; // Adjust according to the API structure
        isLoading = false;
      });
    } else {
      print('Error: ${response.statusCode}');
      setState(() {
        isLoading = false;
      });
    }
  }
}
