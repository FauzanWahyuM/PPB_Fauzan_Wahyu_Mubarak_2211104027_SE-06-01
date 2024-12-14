import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  // Center of the map
  static final LatLng _kMapCenter = LatLng(-7.4305913, 109.2511863);

  // Initial camera position
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
    tilt: 0,
    bearing: 0,
  );

  late GoogleMapController _mapController; // Controller for the map
  final Set<Marker> _markers = {}; // Set of markers

  // Function to create markers
  void _createMarkers() {
    setState(() {
      _markers.addAll([
        // Existing marker 1
        Marker(
          markerId: MarkerId("marker_1"),
          position: _kMapCenter,
          infoWindow:
              InfoWindow(title: "Marker 1", snippet: "This is Marker 1"),
          rotation: 0,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
        // Existing marker 2
        Marker(
          markerId: MarkerId("marker_2"),
          position: LatLng(-6.9733165, 107.6281415),
          infoWindow: InfoWindow(title: "Marker 2"),
          icon: BitmapDescriptor.defaultMarker,
        ),
        // New marker with custom location
        Marker(
          markerId: MarkerId("marker_3"),
          position: LatLng(-7.4274, 109.2616), // New location
          infoWindow: InfoWindow(title: "Marker 3"),
          icon: BitmapDescriptor.defaultMarker, // Default marker icon
        ),
      ]);
    });
  }

  // Callback when the map is created
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller; // Save the map controller
    _createMarkers(); // Create and set markers
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps Demo"),
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition, // Initial camera position
        onMapCreated: _onMapCreated, // Map creation callback
        myLocationEnabled: true, // Enable user location
        markers: _markers, // Add markers to the map
      ),
    );
  }
}
