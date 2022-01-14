import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleUs extends StatefulWidget {
  const GoogleUs({ Key? key }) : super(key: key);

  @override
  _GoogleUsState createState() => _GoogleUsState();
}

class _GoogleUsState extends State<GoogleUs> {
Set<Marker> _markers ={};

void _onMapCreated(GoogleMapController controller){
setState(() {
  _markers.add(
    Marker(markerId: MarkerId('id-1'), 
    position: LatLng(16.851090328198605, 74.584529048809),
    infoWindow: InfoWindow(
      title: 'Diasoft Software Solutions',
      snippet: 'Website design | Android & IOS Apps | Web Applications | Software Development'
    )
     ));
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers ,
        initialCameraPosition: CameraPosition(
          target: LatLng(16.851090328198605, 74.584529048809),
      zoom: 15)),
      
    );
  }
}