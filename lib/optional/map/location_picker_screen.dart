import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  // ─────────────────── Location helpers ───────────────────
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

    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 5,
    );

    final position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );

    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });

    mapController?.animateCamera(CameraUpdate.newLatLng(currentLocation!));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (currentLocation != null) {
      mapController!.animateCamera(CameraUpdate.newLatLng(currentLocation!));
    }
  }

  Future<void> _confirmLocation() async {
    try {
      final placemarks = await placemarkFromCoordinates(
        selectedLatLng!.latitude,
        selectedLatLng!.longitude,
      );

      var address = "Selected Location";
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        address = [
          p.name,
          p.street,
          p.subLocality,
          p.locality,
        ].where((s) => s != null && s.isNotEmpty).join(', ');
      }

      Navigator.pop(context, {'latlng': selectedLatLng, 'address': address});
    } catch (_) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Failed to fetch address")));
    }
  }

  // ───────────────────────── UI ────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Location", style: TextStyle(fontSize: 16.sp)),
      ),
      body: currentLocation == null
          ? Center(
              child: SizedBox(
                height: 40.h,
                width: 40.h,
                child: const CircularProgressIndicator(),
              ),
            )
          : Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: currentLocation!,
                    zoom: 15,
                  ),
                  myLocationEnabled: true,
                  onTap: (latLng) => setState(() => selectedLatLng = latLng),
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
                    bottom: 20.h,
                    left: 16.w,
                    right: 16.w,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _confirmLocation,
                        icon: Icon(Icons.check, size: 20.sp),
                        label: Text(
                          "Select This Location",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 14.h,
                          ), // responsive
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
