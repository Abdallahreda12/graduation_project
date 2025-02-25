import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class CustomFunctions {
  //finction to return current location
  static Future<String> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return "";
    }

    Position position = await Geolocator.getCurrentPosition();
    String locationLink =
        "https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}";
    print(locationLink);
    return locationLink;
  }

  //finction to open google map
  static void openGoogleMaps(BuildContext context) async {
    const googleMapsUrl = "https://www.google.com/maps";
    try {
      if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
        await launchUrl(Uri.parse(googleMapsUrl),
            mode: LaunchMode.externalApplication);
      } else {
        throw "Could not launch Google Maps";
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Could not launch Google Maps"),
        ),
      );
    }
  }
}
