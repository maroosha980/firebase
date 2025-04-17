/*import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BGNUMapScreen extends StatefulWidget {
  const BGNUMapScreen({super.key});

  @override
  BGNUMapScreenState createState() => BGNUMapScreenState();
}

class BGNUMapScreenState extends State<BGNUMapScreen> {
  late GoogleMapController mapController;

  final LatLng _bgnuLocation = LatLng(33.2617, 74.2350); // BGNU location

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BGNU'),
        backgroundColor: Colors.indigo[900], // Dark blue for AppBar
      ),
      backgroundColor: Color(0xFF0D47A1), // Sky dark blue background
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _bgnuLocation,
          zoom: 15.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('bgnu'),
            position: _bgnuLocation,
            infoWindow: InfoWindow(title: 'BGNU'),
          ),
        },
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BgnuMapScreen extends StatefulWidget {
  const BgnuMapScreen({super.key});

  @override
  BgnuMapScreenState createState() => BgnuMapScreenState();
}

class BgnuMapScreenState extends State<BgnuMapScreen> {
  late GoogleMapController mapController;

  final LatLng _bgnuLocation = const LatLng(31.447142, 73.699810);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BGNU Here'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _bgnuLocation,
          zoom: 15.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('bgnu'),
            position: _bgnuLocation,
            infoWindow: InfoWindow(title: 'Baba Guru Nanak University'),
          ),
        },
      ),
    );
  }
}