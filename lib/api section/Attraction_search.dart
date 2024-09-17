import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class Attraction_Search extends StatefulWidget {
  const Attraction_Search({super.key});

  @override
  State<Attraction_Search> createState() => _Attraction_SearchState();
}

class _Attraction_SearchState extends State<Attraction_Search> {
  final String apiKey = '39a126ecb2msh9ff90f29f822fd6p19aa71jsnd88ee363dba7';
  final String apiHost = 'booking-com15.p.rapidapi.com';
  List<dynamic> attractions = [];
  bool isLoading = false;
  bool hasSearched = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search for Attractions',
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
          : hasSearched && attractions.isEmpty
          ? const Center(child: Text('No attractions found. Please try again.'))
          : !hasSearched
          ? const Center(
        child: Text(
          'Press the search button to search for Attractions',
          style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: attractions.length,
        itemBuilder: (context, index) {
          final attraction = attractions[index];
          print('Displaying attraction: $attraction');
          final id = attraction['id'] ?? 'N/A';
          final typename = attraction['__typename'] ?? 'N/A';
          final title = attraction['title'] ?? 'N/A';
          final productId = attraction['productId'] ?? 'N/A';
          final productSlug = attraction['productSlug'] ?? 'N/A';
          final taxonomySlug = attraction['taxonomySlug'] ?? 'N/A';
          final cityName = attraction['cityName'] ?? 'N/A';
          final countryCode = attraction['countryCode'] ?? 'N/A';

          // Debugging: Print each attraction data
          print('Attraction: $attraction');

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID: $id',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Type: $typename',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Title: $title',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Product ID: $productId',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Product Slug: $productSlug',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Taxonomy Slug: $taxonomySlug',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'City: $cityName',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Country: $countryCode',
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
        onPressed: fetchAttractions,
        child: const FaIcon(FontAwesomeIcons.magnifyingGlass, color: Colors.white),
      ),
    );
  }

  void fetchAttractions() async {
    setState(() {
      isLoading = true;
      hasSearched = true;
    });

    const url =
        'https://booking-com15.p.rapidapi.com/api/v1/attraction/searchLocation?query=new&languagecode=en-us';
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': apiHost,
    });

    if (response.statusCode == 200) {
      final body = response.body;
      print(body); // Debugging: print the response body to the console

      final jsonResponse = jsonDecode(body);

      // Check if 'data' is a List directly or wrapped inside another structure
      if (jsonResponse is Map<String, dynamic>) {
        final data = jsonResponse['data']; // Check what 'data' contains

        if (data is List) {
          // Case where 'data' is a List of attractions
          setState(() {
            attractions = data;
            print(attractions); // Verify attractions list is correctly populated
            isLoading = false;
          });
        } else if (data is Map<String, dynamic>) {
          // Case where 'data' is a Map, try extracting 'results' or similar
          final attractionsList = data['results'] ?? [];
          setState(() {
            attractions = attractionsList as List<dynamic>;
            print(attractions); // Verify attractions list is correctly populated
            isLoading = false;
          });
        } else {
          setState(() {
            attractions = []; // Empty list if no results found
            isLoading = false;
          });
          print('Unexpected structure for "data"');
        }
      } else {
        print('Unexpected response format');
        setState(() {
          isLoading = false;
        });
      }
    } else {
      print('Error: ${response.statusCode}');
      setState(() {
        isLoading = false;
      });
    }
  }



}
