import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  LatLng? selectedLatLng;
  GoogleMapController? mapController;
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    final locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 5,
    );

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );

    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });

    if (mapController != null) {
      mapController!.animateCamera(CameraUpdate.newLatLng(currentLocation!));
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (currentLocation != null) {
      mapController!.animateCamera(CameraUpdate.newLatLng(currentLocation!));
    }
  }

  Future<void> _confirmLocation() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        selectedLatLng!.latitude,
        selectedLatLng!.longitude,
      );

      String address = "Selected Location";
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        address = [
          place.name,
          place.street,
          place.subLocality,
          place.locality,
        ].where((s) => s != null && s.isNotEmpty).join(', ');
      }

      Navigator.pop(context, {'latlng': selectedLatLng, 'address': address});
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Failed to fetch address")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Location")),
      body: currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: currentLocation!,
                    zoom: 15,
                  ),
                  myLocationEnabled: true,
                  onTap: (LatLng latLng) {
                    setState(() {
                      selectedLatLng = latLng;
                    });
                  },
                  markers: selectedLatLng != null
                      ? {
                          Marker(
                            markerId: const MarkerId('selected'),
                            position: selectedLatLng!,
                          ),
                        }
                      : {},
                ),
                if (selectedLatLng != null)
                  Positioned(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    child: ElevatedButton.icon(
                      onPressed: _confirmLocation,
                      icon: const Icon(Icons.check),
                      label: const Text("Select This Location"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
