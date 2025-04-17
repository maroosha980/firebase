import 'package:flutter/material.dart';
import 'package:googlemap/search.dart';


import 'bgnu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GoogleMapScreen(),
    );
  }
}

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GOOGLE Map'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.brown,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GoogleMapScreenn()),
                  );
                },
                child: Text('SEARCH Location'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BgnuMapScreen()),
                  );
                },
                child: Text('BGNU Locations'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
