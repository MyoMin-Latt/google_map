import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:url_launcher/url_launcher.dart'; // Only import if required functionality is not exposed by default

class FlutterMapPage extends StatelessWidget {
  const FlutterMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.all(10),
          height: 250,
          child: FlutterMap(
            options: MapOptions(
              interactiveFlags: InteractiveFlag.pinchZoom,
              center: const LatLng(16.826587, 96.130196),
              zoom: 17,
            ),
            nonRotatedChildren: [
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                    onTap: () => launchUrl(
                        Uri.parse('https://openstreetmap.org/copyright')),
                  ),
                ],
              ),
            ],
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: const LatLng(16.826587, 96.130196),
                    width: 90,
                    height: 90,
                    builder: (context) => const Icon(
                      Icons.location_on,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
