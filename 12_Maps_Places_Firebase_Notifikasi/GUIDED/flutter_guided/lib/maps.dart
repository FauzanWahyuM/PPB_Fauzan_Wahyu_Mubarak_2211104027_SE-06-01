import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

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

  String _selectedAddress = "Pilih lokasi di peta"; // Selected address
  LatLng? _selectedLocation; // Selected LatLng

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
      ]);
    });
  }

  // Callback when the map is tapped
  Future<void> _onMapTap(LatLng position) async {
    setState(() {
      _selectedLocation = position; // Update selected location
      _markers.add(
        Marker(
          markerId: MarkerId("selected_marker"),
          position: position,
          infoWindow: InfoWindow(title: "Lokasi Dipilih"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    });

    // Get address from coordinates
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
          _selectedAddress =
              "${place.street}, ${place.locality}, ${place.administrativeArea}";
        });
      }
    } catch (e) {
      setState(() {
        _selectedAddress = "Tidak dapat mendapatkan alamat";
      });
    }
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
        title: const Text("Place Picker"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition:
                  _kInitialPosition, // Initial camera position
              onMapCreated: _onMapCreated, // Map creation callback
              myLocationEnabled: true, // Enable user location
              markers: _markers, // Add markers to the map
              onTap: _onMapTap, // Handle map tap
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lokasi yang dipilih:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(_selectedAddress),
                if (_selectedLocation != null)
                  Text(
                    "Koordinat: (${_selectedLocation!.latitude}, ${_selectedLocation!.longitude})",
                  ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan aksi untuk menyimpan lokasi
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Lokasi disimpan!')),
                    );
                  },
                  child: const Text('Simpan Lokasi'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
