import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(8.348975, 124.972012),
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        // MarkerLayerOptions(
        //   markers: [
        //     for (int i = 0; i < data.size; i++)
        //       Marker(
        //         height: 100,
        //         width: 100,
        //         point: LatLng(data.docs[i]['lat'], data.docs[i]['long']),
        //         builder: (ctx) => Container(
        //           decoration: const BoxDecoration(
        //             image: DecorationImage(
        //               image: AssetImage(
        //                 'assets/images/heat.png',
        //               ),
        //               opacity: 50,
        //             ),
        //           ),
        //         ),
        //       ),
        //   ],
        // ),
      ],
      children: const [],
    );
  }
}
