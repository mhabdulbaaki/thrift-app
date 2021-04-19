import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectPlaceOnMap extends StatefulWidget {
  @override
  _SelectPlaceOnMapState createState() => _SelectPlaceOnMapState();
}

class _SelectPlaceOnMapState extends State<SelectPlaceOnMap> {
  GoogleMapController mapController;
  static const LatLng _center =
      const LatLng(5.590862331813193, -0.15940897711195348);

  final Set<Marker> markers = {};
  LatLng currentMapPosition = _center;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onCameraMove(CameraPosition position) {
    currentMapPosition = position.target;
  }

  void onCameraIdle() {
    setState(() {
      markers.add(Marker(
          markerId: MarkerId(currentMapPosition.toString()),
          position: currentMapPosition,
          visible: false));
      print(
          'lat: ${currentMapPosition.latitude}, lon: ${currentMapPosition.longitude}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            Align(
                alignment: Alignment.center,
                child: Opacity(
                    opacity: 0.4,
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/place_marker.png'),
                        fit: BoxFit.contain,
                      )),
                    )))
          ],
        ),
      ),
    );
  }
}
