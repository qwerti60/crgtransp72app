import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyAppCities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CitySelectorScreen(),
    );
  }
}

class CitySelectorScreen extends StatefulWidget {
  @override
  _CitySelectorScreenState createState() => _CitySelectorScreenState();
}

class _CitySelectorScreenState extends State {
  List _cities = [];
  String? _selectedCity;

  @override
  void initState() {
    super.initState();
    _fetchCities();
  }

  Future _fetchCities() async {
    final response = await http.get(Uri.parse('https://ivnovav.ru/cities.php'));

    if (response.statusCode == 200) {
      setState(() {
        _cities = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load cities');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a City'),
      ),
      body: _cities.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  hint: Text('Select city'),
                  value: _selectedCity,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCity = newValue;
                    });
                  },
                  items: _cities.map<DropdownMenuItem<String>>((dynamic city) {
                    return DropdownMenuItem(
                      value: city['name'],
                      child: Text(city['name']),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: _selectedCity == null
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NextScreen(city: _selectedCity!)),
                          );
                        },
                  child: Text('Next'),
                ),
              ],
            ),
    );
  }
}

class NextScreen extends StatelessWidget {
  final String city;

  NextScreen({required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected City'),
      ),
      body: Center(
        child: Text('You selected: $city'),
      ),
    );
  }
}
