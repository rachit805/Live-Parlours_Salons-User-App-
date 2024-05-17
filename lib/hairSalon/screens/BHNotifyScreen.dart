import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:booking/hairSalon/utils/panel.dart';
import 'package:booking/hairSalon/model/BHModel.dart';
import 'package:booking/hairSalon/utils/BHColors.dart';
import 'package:booking/hairSalon/utils/BHDataProvider.dart';
import 'package:booking/hairSalon/utils/BHImages.dart';
import 'package:booking/main/utils/AppWidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

class BHNotifyScreen extends StatefulWidget {
  static String tag = '/SlideUpSheetScreen';

  @override
  SlideUpSheetScreenState createState() => SlideUpSheetScreenState();

}

class SlideUpSheetScreenState extends State<BHNotifyScreen> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController ;

  var geolocator = Geolocator();
  Position currentPosition;

  void setupPositionLocator() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp= new CameraPosition(target : pos, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.31059, 77.415891),
    zoom: 14.4746,
  );
  List<BHNotifyModel> notifyList;

  @override
  void initState() {
    super.initState();
    notifyList = getNotifyList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:[
            GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              tiltGesturesEnabled: true,
              onCameraMove: (CameraPosition cameraPosition){
                print(cameraPosition.zoom);
              },

              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                mapController = controller;

                setupPositionLocator();
              },
            
             
           ),

    ]
        )
    );

  }


}









