import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = '55c7cc897bmshdd2c886dd5930b9p1c1592jsn46b784a37fdf';
  final String apiUrl = 'https://booking-com18.p.rapidapi.com/stays/auto-complete?query=pakistan';

  Future<List<dynamic>?> fetchDestinationData() async {
    try {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': ' booking-com18.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data['data'] as List<dynamic>?; // Extract the 'data' list
      } else {
        print('Failed to load data: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
