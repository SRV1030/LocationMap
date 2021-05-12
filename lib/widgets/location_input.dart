import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl; //supplied by google

  //Getting userLocation
  Future<Void> _getCurrentLocation() async {
    final locationdata = await Location().getLocation();
    print(locationdata.latitude);
    print(locationdata.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageUrl == null
              ? Text(
                  "No location choosen",
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              onPressed: _getCurrentLocation,
              label: Text("Current Location"),
              textColor: Theme.of(context).primaryColor,
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              onPressed: () {},
              label: Text("Select on map"),
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
