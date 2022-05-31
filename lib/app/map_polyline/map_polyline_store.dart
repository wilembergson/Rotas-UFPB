import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:routes_ufpb/data/entities/point.dart';
import 'package:routes_ufpb/data/entities/route_line.dart';
import 'package:routes_ufpb/domain/usecase/get_all_points.dart';
import 'package:routes_ufpb/domain/usecase/get_all_routes.dart';
import 'package:routes_ufpb/utils/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'map_polyline_store.g.dart';

class MapPolylineStore = _MapPolylineStoreBase with _$MapPolylineStore;

abstract class _MapPolylineStoreBase with Store {
  final GetAllPoints _getAllPoints = GetAllPoints();
  final GetAllRoutes _getAllRoutes = GetAllRoutes();

  @observable
  Set<Marker> markers = {};

  @observable
  Set<Polyline> polyline = {};

  @observable
  List<Point> points = [];

  @observable
  List<Point> pointsFilter = [];

  @observable
  List<Point> pointsEnd = [];

  @observable
  List<RouteLine> routesLine = [];

  @observable
  bool visibleRoute = false;

  @observable
  Point? start;

  @observable
  Point? end;

  @observable
  bool isLoading = true;

  @observable
  TextEditingController startControler = TextEditingController();

  @observable
  TextEditingController endControler = TextEditingController();

  @observable
  String appVersion = '';

  final LatLng initialPosi = const LatLng(-7.137493, -34.845854);

  Future<void> init() async {
    if (!kIsWeb) {
      getAppVersion();
    }
    await setSegment();
  }

  @action
  Future<void> setSegment() async {
    final resultPoints = await _getAllPoints();
    final resultRoutesLine = await _getAllRoutes();

    points = resultPoints;
    routesLine = resultRoutesLine;

    final Set<Marker> markesTmp = {};

    if (points.isNotEmpty) {
      for (final point in points) {
        markesTmp.add(generateMark(point));
      }
    }

    markers = markesTmp;

    isLoading = false;
  }

  @action
  setVisibleRoute() {
    if (!isLoading) {
      if (visibleRoute) {
        startControler.clear();
        endControler.clear();
      }
      visibleRoute = !visibleRoute;
    }
  }

  Marker generateMark(Point point) {
    return Marker(
      markerId: MarkerId(point.id),
      position: LatLng(point.lat, point.lng),
      infoWindow: InfoWindow(
        title: point.name,
        snippet: 'Descricao sobre o centro\nAcessivel!',
      ),
    );
  }

  Polyline generatePolyline(RouteLine routeLine, BuildContext context) {
    return Polyline(
        polylineId: PolylineId(routeLine.name),
        visible: true,
        points: routeLine.getCord(),
        color: getColorLine(routeLine.accessible));
  }

  String getMessageRoute(bool accessible) {
    if (accessible) {
      return "Está rota é acessivel!";
    }
    return "Está rota não é acessivel!";
  }

  Color getColorLine(bool acessible) {
    if (acessible) {
      return Colors.blue;
    }

    return Colors.orange;
  }

  @action
  getPolyline(BuildContext context) async {
    if (start != null && end != null) {
      final RouteLine? route = routesLine.firstWhere((element) =>
          element.idStart == start?.id && element.idEnd == end?.id);

      if (route != null) {
        final line = generatePolyline(route, context);

        polyline.clear();
        polyline.add(line);

        showMessage(
          context,
          getColorLine(route.accessible),
          getMessageRoute(route.accessible),
        );
      } else {
        showMessage(
            context, Colors.red, "Ops, não temos essa rota mapeada ainda :(");
      }

      visibleRoute = false;
      startControler.clear();
      endControler.clear();
    } else {
      showMessage(context, Colors.grey,
          "Ops, selecione origem e destino para gerar uma rota!");
    }
    // if (start != null && end != null) {
    //   PolylinePoints polylinePoints = PolylinePoints();
    //   try {
    //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    //         Secrets.API_KEY,
    //         PointLatLng(
    //           start!.lat,
    //           start!.lng,
    //         ),
    //         PointLatLng(
    //           end!.lat,
    //           end!.lng,
    //         ),
    //         travelMode: TravelMode.walking);

    //     polyline.clear();
    //     final poli = [
    //       Polyline(
    //           polylineId: const PolylineId("id"),
    //           visible: true,
    //           points: result.points
    //               .map((e) => LatLng(e.latitude, e.longitude))
    //               .toList(),
    //           width: 2,
    //           color: getColorLine(false))
    //     ];

    //     polyline.addAll(poli);
    //   } catch (e) {
    //     print(e);
    //   }
    // }
  }

  @action
  setPointStart(Point point) {
    startControler.text = point.name;
    start = point;
    pointsFilter = [];
  }

  @action
  setPointEnd(Point point) {
    endControler.text = point.name;
    end = point;
    pointsEnd = [];
  }

  @action
  filter(String filter) {
    if (filter.isEmpty) {
      pointsFilter = [];
    }

    pointsFilter = points
        .where((element) =>
            element.name.toLowerCase().contains(filter.toLowerCase()))
        .toList();
  }

  @action
  filterEnd(String filter) {
    if (filter.isEmpty) {
      pointsEnd = [];
    }

    pointsEnd = points
        .where((element) =>
            element.name.toLowerCase().contains(filter.toLowerCase()))
        .toList();
  }

  setPrefersShowTutorialHome() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("tutorialHome", true);
  }

  showTutorialHome(context, targets) async {
    final prefs = await SharedPreferences.getInstance();
    final bool? tutorial = prefs.getBool("tutorialHome");
    if (tutorial == null) {
      Util().afterLayoutTutorial(context, targets);
      setPrefersShowTutorialHome();
    }
  }

  setPrefersShowTutorialBar() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("tutorialBar", true);
  }

  showTutorialBar(context, targets) async {
    final prefs = await SharedPreferences.getInstance();
    final bool? tutorial = prefs.getBool("tutorialBar");
    if (tutorial == null) {
      Util().afterLayoutTutorial(context, targets);
      setPrefersShowTutorialBar();
    }
  }

  @action
  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
  }

  void showMessage(
    BuildContext context,
    Color color,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
