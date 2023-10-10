import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:g_map/flutter_map_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  MapView;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: Home(),
      home: FlutterMapPage(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final _initialCameraPosition =
  //     const CameraPosition(target: LatLng(16.826587, 96.130196), zoom: 17);

  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();

  // MapType _mapType = MapType.normal;
  // final _shweDaGonLatLng = const LatLng(16.798649450442266, 96.14954955557084);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map Flutteer'),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 200,
              child: Card(
                elevation: 2,
                child: Stack(
                  children: [
                    GoogleMap(
                      compassEnabled: false,
                      mapToolbarEnabled: false,
                      rotateGesturesEnabled: false,
                      scrollGesturesEnabled: false,
                      zoomControlsEnabled: false,
                      zoomGesturesEnabled: false,
                      tiltGesturesEnabled: false,
                      myLocationButtonEnabled: false,
                      buildingsEnabled: false,
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(16.826587, 96.130196),
                        zoom: 17,
                      ),
                      markers: {
                        const Marker(
                          markerId: MarkerId("marker1"),
                          position: LatLng(16.826587, 96.130196),
                        ),
                      },
                    ),
                    // GoogleMap(
                    //   initialCameraPosition: const CameraPosition(
                    //       target: LatLng(16.826587, 96.130196), zoom: 17),
                    //   // mapType: _mapType,
                    //   // myLocationEnabled: true,
                    //   onMapCreated: (controller) {
                    //     // TODO: controller is important
                    //     _controller.complete(controller);
                    //   },
                    //   markers: {
                    //     Marker(
                    //       markerId: const MarkerId("marker1"),
                    //       position: const LatLng(16.826587, 96.130196),
                    //       draggable: true,
                    //       onDragEnd: (value) {
                    //         // value is the new position
                    //       },
                    //       // To do: custom marker icon
                    //     ),
                    //   },
                    // ),

                    // zoom in/ out
                    // Positioned(
                    //   top: 7,
                    //   right: 7,
                    //   child: Container(
                    //     color: Colors.blue.withOpacity(0.4),
                    //     child: Row(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         IconButton(
                    //           onPressed: () async {
                    //             final controller = await _controller.future;
                    //             controller.animateCamera(
                    //               CameraUpdate.zoomIn(),
                    //             );
                    //           },
                    //           icon: const Icon(Icons.add),
                    //         ),
                    //         IconButton(
                    //           onPressed: () async {
                    //             final controller = await _controller.future;
                    //             controller.animateCamera(
                    //               CameraUpdate.zoomOut(),
                    //             );
                    //           },
                    //           icon: const Icon(Icons.remove),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    // // mapType
                    // Positioned(
                    //   bottom: 7,
                    //   left: 7,
                    //   child: Container(
                    //     color: Colors.blue.withOpacity(0.4),
                    //     child: IconButton(
                    //       onPressed: () {
                    //         setState(() {
                    //           if (_mapType == MapType.normal) {
                    //             _mapType = MapType.hybrid;
                    //           } else {
                    //             _mapType = MapType.normal;
                    //           }
                    //         });
                    //       },
                    //       icon: const Icon(Icons.satellite_alt_outlined),
                    //     ),
                    //   ),
                    // ),

                    // // moveCamera/ newCameraPosition
                    // Positioned(
                    //   top: 7,
                    //   left: 7,
                    //   child: Container(
                    //     color: Colors.blue.withOpacity(0.4),
                    //     child: IconButton(
                    //       onPressed: () async {
                    //         final controller = await _controller.future;
                    //         controller.moveCamera(
                    //           CameraUpdate.newCameraPosition(
                    //             CameraPosition(
                    //               target: _shweDaGonLatLng,
                    //               zoom: 14,
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //       icon: const Icon(Icons.temple_buddhist),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
