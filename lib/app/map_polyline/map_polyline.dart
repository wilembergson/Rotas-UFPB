import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:routes_ufpb/app/map_polyline/map_polyline_store.dart';
import 'package:routes_ufpb/app/widgets/bar_search_route.dart';

class MapPolyline extends StatefulWidget {
  final MapPolylineStore store;

  const MapPolyline({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<MapPolyline> createState() => _MapPolylineState();
}

class _MapPolylineState extends State<MapPolyline> {
  late GoogleMapController controller;

  @override
  Widget build(BuildContext context) {
    final store = widget.store;

    return Observer(
      builder: (context) {
        if (store.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            GoogleMap(
              polylines: store.polyline,
              markers: store.markers,
              onMapCreated: onMapCreated,
              initialCameraPosition: CameraPosition(
                target: store.initialPosi,
                zoom: 16.0,
              ),
              zoomGesturesEnabled: !store.visibleRoute,
              zoomControlsEnabled: true,
              mapType: MapType.normal,
            ),
            if (store.visibleRoute)
              BarSearchRoute(
                store: store,
              ),
          ],
        );
      },
    );
  }

  void onMapCreated(GoogleMapController controllerParam) {
    controller = controllerParam;
  }
}
