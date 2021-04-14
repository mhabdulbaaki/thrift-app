import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;
  //final LatLng _center = const LatLng(45.521563, -122.677433);
  static const LatLng _center =
      const LatLng(5.590862331813193, -0.15940897711195348);
  final Set<Marker> markers = {
    Marker(
      markerId: MarkerId(_center.toString()),
      position: _center,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    )
  };
  LatLng lastMapPosition = _center;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  void onCameraIdle() {
    setState(() {
      markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(lastMapPosition.toString()),
        position: lastMapPosition,
        icon: BitmapDescriptor.defaultMarker,
      ));
      print(
          'lat: ${lastMapPosition.latitude}, lon: ${lastMapPosition.longitude}');
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Stack(
          children: [
            GoogleMap(
              onCameraIdle: onCameraIdle,
              onCameraMove: onCameraMove,
              markers: markers,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.0,
              ),
            ),
            Positioned(
                left: (size.width) / 2,
                top: (size.height) / 2,
                child: Icon(Icons.place))
          ],
        ),
      ),
    );
  }
}
