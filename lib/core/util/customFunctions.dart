import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class CustomFunctions {
  /// Function to return current address as string
  static Future<String> getCurrentLocation() async {
    try {
      // Request permission
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return "Location permission denied";
      }

      // Get coordinates
      Position position = await Geolocator.getCurrentPosition();

      // Convert to human-readable address
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String address =
            "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
        return address;
      } else {
        return "No address found for location";
      }
    } catch (e) {
      print("Error getting location/address: $e");
      return "Error getting address";
    }
  }

  /// Returns the Google Maps URL and optionally opens it
  static Future<String> openGoogleMaps(BuildContext context,
      {bool launchNow = true}) async {
    const googleMapsUrl = "https://www.google.com/maps";

    try {
      if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
        if (launchNow) {
          await launchUrl(Uri.parse(googleMapsUrl),
              mode: LaunchMode.externalApplication);
        }
        return googleMapsUrl;
      } else {
        throw Exception("Could not launch Google Maps");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not launch Google Maps")),
      );
      return "";
    }
  }
}
