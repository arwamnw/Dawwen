// ignore_for_file: unused_field, prefer_const_constructors, unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MapSample());

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  String address = '';
  final Completer<GoogleMapController> _controller = Completer();

  Future<Position> _getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

//set the camera position
  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(21.488498046, 39.187332584), zoom: 14);

//polyline
  Set<Polyline> polylines = {};

//markers on the map of current location and theapy centers
  final List<Marker> _markers = <Marker>[];
  List<Marker> list = const [
    //current location coordinates
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(21.488498046, 39.187332584),
        infoWindow: InfoWindow(title: 'some Info ')),
    //therapy centers
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(21.609174, 39.211484),
        infoWindow: InfoWindow(
          title: 'مركز 1',
        )),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(21.632314, 39.207873),
        infoWindow: InfoWindow(
          title: 'مركز 2',
        )),
    Marker(
        markerId: MarkerId('4'),
        position: LatLng(21.59963, 39.241823),
        infoWindow: InfoWindow(
          title: 'مركز 3',
        )),
    Marker(
        markerId: MarkerId('5'),
        position: LatLng(21.589255, 39.232475),
        infoWindow: InfoWindow(
          title: 'مركز 4',
        )),
    Marker(
        markerId: MarkerId('6'),
        position: LatLng(21.582391, 39.220031),
        infoWindow: InfoWindow(
          title: 'مركز 5',
        )),
    Marker(
        markerId: MarkerId('7'),
        position: LatLng(21.551437, 39.211378),
        infoWindow: InfoWindow(
          title: 'مركز 6',
        )),
    Marker(
        markerId: MarkerId('8'),
        position: LatLng(21.505495, 39.21579),
        infoWindow: InfoWindow(
          title: 'مركز 7',
        )),
    Marker(
        markerId: MarkerId('9'),
        position: LatLng(21.595065, 39.137213),
        infoWindow: InfoWindow(
          title: 'مركز 8',
        )),
    Marker(
        markerId: MarkerId('10'),
        position: LatLng(21.415486, 39.228142),
        infoWindow: InfoWindow(
          title: 'مركز 9',
        )),
    Marker(
        markerId: MarkerId('11'),
        position: LatLng(21.59378, 39.166878),
        infoWindow: InfoWindow(
          title: 'مركز 10',
        )),
  ];

  @override
  void initState() {
    super.initState();
    _markers.addAll(list);
  }

//getting current location target
  loadData() {
    _getUserCurrentLocation().then((value) async {
      _markers.add(Marker(
          markerId: const MarkerId('SomeId'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: address)));

      final GoogleMapController controller = await _controller.future;
      CameraPosition kGooglePlex = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );
      controller.animateCamera(CameraUpdate.newCameraPosition(kGooglePlex));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 2,
          backgroundColor: Color.fromARGB(255, 152, 173, 196),
          title: Text(
            'الخريطة',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GoogleMap(
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                scrollGesturesEnabled: true,
                compassEnabled: true,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.25),
                initialCameraPosition: initialCameraPosition,
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                markers: Set<Marker>.of(_markers),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              Container(
                height: MediaQuery.of(context).size.height * .2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _getUserCurrentLocation().then((value) async {
                          _markers.add(Marker(
                              markerId: const MarkerId('SomeId'),
                              position: LatLng(value.latitude, value.longitude),
                              infoWindow: InfoWindow(title: address)));
                          final GoogleMapController controller =
                              await _controller.future;

                          CameraPosition kGooglePlex = CameraPosition(
                            target: LatLng(value.latitude, value.longitude),
                            zoom: 14,
                          );
                          controller.animateCamera(
                              CameraUpdate.newCameraPosition(kGooglePlex));

                          List<Placemark> placemarks =
                              await placemarkFromCoordinates(
                                  value.latitude, value.longitude);

                          final add = placemarks.first;
                          address =
                              "${add.locality} ${add.administrativeArea} ${add.subAdministrativeArea} ${add.country}";

                          setState(() {});
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 199, 212, 199),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            'قم بتحديد موقعك',
                            style: TextStyle(
                                color: Color.fromARGB(96, 5, 44, 29),
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(address),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
