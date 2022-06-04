import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController _controller;
  final _initialCameraPosition = const CameraPosition(
    target: LatLng(
      1.4146019918043515,
      103.794310731327,
    ),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map Flutteer'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) {
              _controller = controller;
            },
          ),
          Positioned(
            top: 7,
            right: 7,
            child: Container(
              color: Colors.blue.withOpacity(0.4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      _controller.animateCamera(
                        CameraUpdate.zoomIn(),
                      );
                    },
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () {
                      _controller.animateCamera(
                        CameraUpdate.zoomOut(),
                      );
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
