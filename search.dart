
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class GoogleMapScreenn extends StatefulWidget {
  const GoogleMapScreenn({super.key});

  @override
  GoogleMapScreennState createState() => GoogleMapScreennState();
}

class GoogleMapScreennState extends State<GoogleMapScreenn> {
  final _searchController = TextEditingController();
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _searchLocation() async {
    try {
      String query = _searchController.text;
      if (query.isEmpty) return;

      List<Location> locations = await locationFromAddress(query);

      if (locations.isNotEmpty) {
        Location location = locations.first;
        LatLng latLng = LatLng(location.latitude, location.longitude);

        _mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: latLng, zoom: 15),
          ),
        );

        setState(() {
          _markers.clear();
          _markers.add(
            Marker(
              markerId: MarkerId('searchedLocation'),
              position: latLng,
              infoWindow: InfoWindow(title: query),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            ),
          );
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Location not found: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Search'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Enter a location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _searchLocation,
                  child: Text('Search'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(37.7749, -122.4194), // Default: San Francisco
                zoom: 12,
              ),
              markers: _markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
