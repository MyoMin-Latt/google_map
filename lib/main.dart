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
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(16.826587, 96.130196), zoom: 17);

  late GoogleMapController _controller;

  MapType _mapType = MapType.normal;
  final _shweDaGonLatLng = const LatLng(16.798649450442266, 96.14954955557084);

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
            mapType: _mapType,
            myLocationEnabled: true,
            onMapCreated: (controller) {
              // TODO: controller is important
              _controller = controller;
            },
            markers: {
              Marker(
                markerId: const MarkerId("marker1"),
                position: const LatLng(16.826587, 96.130196),
                draggable: true,
                onDragEnd: (value) {
                  // value is the new position
                },
                // To do: custom marker icon
              ),
            },
          ),

          // zoom in/ out
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
          ),

          // mapType
          Positioned(
            bottom: 7,
            left: 7,
            child: Container(
              color: Colors.blue.withOpacity(0.4),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (_mapType == MapType.normal) {
                      _mapType = MapType.hybrid;
                    } else {
                      _mapType = MapType.normal;
                    }
                  });
                },
                icon: const Icon(Icons.satellite_alt_outlined),
              ),
            ),
          ),

          // moveCamera/ newCameraPosition
          Positioned(
            top: 7,
            left: 7,
            child: Container(
              color: Colors.blue.withOpacity(0.4),
              child: IconButton(
                onPressed: () {
                  _controller.moveCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: _shweDaGonLatLng,
                        zoom: 14,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.temple_buddhist),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
