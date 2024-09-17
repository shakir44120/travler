import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travler/api%20section/api%20server.dart'; // Import your API service

class StaysApi extends StatefulWidget {
  const StaysApi({Key? key}) : super(key: key);

  @override
  State<StaysApi> createState() => _StaysApiState();
}

class _StaysApiState extends State<StaysApi> {
  List<dynamic>? destinationData; // Store fetched data
  List<dynamic> hotels = []; // Store the list of hotels
  bool isLoading = false; // For loading state
  bool hasSearched = false; // To track if search has been triggered

  Future<void> fetchData() async {
    setState(() {
      isLoading = true; // Show loading indicator
      hasSearched = true; // Set to true after search button is pressed
    });

    List<dynamic>? data = await ApiService().fetchDestinationData(); // Fetch data from API

    setState(() {
      destinationData = data;
      hotels = data ?? []; // Update the hotels list with fetched data
      isLoading = false; // Hide loading indicator
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search Hotels',
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
          : hasSearched && hotels.isEmpty
          ? const Center(child: Text('No hotels found. Please try again.'))
          : !hasSearched
          ? const Center(
        child: Text(
          'Press the search button to load hotels.',
          style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final hotel = hotels[index];
          final name = hotel['name'] ?? 'Unknown';
          final latitude = hotel['latitude']?.toString() ?? 'N/A';
          final longitude = hotel['longitude']?.toString() ?? 'N/A';
          final country = hotel['country'] ?? 'Unknown';
          final timezone = hotel['timezone_name'] ?? 'Unknown';
          final timezoneoffset = hotel['timezone_offset']?.toString() ?? 'Unknown';
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
                    Row(
                      children: [
                        const Text(
                          'Hotel City:  ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Coordinates',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Text('Latitude: '),
                        Text(latitude),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Longitude: '),
                        Text(longitude),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text('Time Zone: '),
                        Text(
                          timezone,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      country,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(timezoneoffset),
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
        onPressed: fetchData, // Trigger API call
        child: const FaIcon(FontAwesomeIcons.magnifyingGlass, color: Colors.white),
      ),
    );
  }
}
