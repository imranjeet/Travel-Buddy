import 'package:flutter/material.dart';

class AirportProvider with ChangeNotifier {
  final List<String> _airportList = [
    'DEL - Indira Gandhi International Airport (Delhi)',
    'BOM - Chhatrapati Shivaji Maharaj International Airport (Mumbai)',
    'BLR - Kempegowda International Airport (Bengaluru)',
    'MAA - Chennai International Airport',
    'HYD - Rajiv Gandhi International Airport (Hyderabad)',
    'CCU - Netaji Subhas Chandra Bose International Airport (Kolkata)',
    'COK - Cochin International Airport (Kochi)',
    'IXC - Chandigarh International Airport',
    'ATQ - Sri Guru Ram Dass Jee International Airport (Amritsar)',
    'GOI - Goa International Airport (Dabolim)',
    'PNQ - Pune Airport (Lohegaon)',
    'JAI - Jaipur International Airport',
    'AMD - Sardar Vallabhbhai Patel International Airport (Ahmedabad)',
    'BHU - Lal Bahadur Shastri Airport (Varanasi)',
    'IXE - Mangalore International Airport',
    'TRV - Trivandrum International Airport (Thiruvananthapuram)',
    'IXR - Birsa Munda Airport (Ranchi)',
    'PAT - Lok Nayak Jayaprakash Airport (Patna)',
    'RPR - Swami Vivekananda Airport (Raipur)',
    'VNS - Veer Savarkar International Airport (Port Blair)',
    'VTZ - Visakhapatnam Airport',
    'IXA - Maharaja Bir Bikram Airport (Agartala)',
    'IXD - Allahabad Airport (Bamrauli)',
    'GAY - Gaya Airport',
    'IMF - Lal Bahadur Shastri Airport (Banbasa)',
    'IXW - Birsa Munda Airport (Jamshedpur)',
    'IXH - Lilabari Airport (North Lakhimpur)',
    'STV - Surat Airport',
    'IXG - Belgaum Airport',
  ];

  final List<String> _filteredAirportList = [];
  DateTime _selectedDate = DateTime.now();

  List<String> get airportList => [..._airportList];
  List<String> get filteredAirportList => [..._filteredAirportList];
  DateTime get selectedDate => _selectedDate;

  void filterAirports(String query) {
    _filteredAirportList.clear(); // Clear previous suggestions
    if (query.isEmpty) {
      _filteredAirportList
          .addAll(_airportList); // Show all airports if query is empty
    } else {
      final pattern = RegExp(query, caseSensitive: false);
      _filteredAirportList
          .addAll(_airportList.where((airport) => pattern.hasMatch(airport)));
    }
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }
}
