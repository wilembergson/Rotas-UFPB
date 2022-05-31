import 'package:flutter/material.dart';

import 'package:routes_ufpb/app/map_polyline/map_polyline.dart';
import 'package:routes_ufpb/app/map_polyline/map_polyline_store.dart';
import 'package:routes_ufpb/app/widgets/custom_draer.dart';
import 'package:routes_ufpb/app/widgets/target_custom.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MapPolylineStore store = MapPolylineStore();

  GlobalKey routeButtomKey = GlobalKey();

  List<TargetFocus> targets = <TargetFocus>[];

  @override
  void initState() {
    super.initState();
    store.init();

    initTargets();
    store.showTutorialHome(context, targets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa Campus I"),
        centerTitle: true,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          key: routeButtomKey,
          onTap: store.setVisibleRoute,
          child: const CircleAvatar(
            maxRadius: 50,
            child: Icon(
              Icons.route,
              color: Colors.orange,
              size: 60,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      drawer: CustomDrawer(
        appVersion: store.appVersion,
      ),
      body: MapPolyline(
        store: store,
      ),
    );
  }

  void initTargets() {
    targets.clear();
    targets.add(
      TargetCustom().call(
          "routeButtomKey",
          routeButtomKey,
          "Botão para selecionar rotas",
          "Clique aqui para selecionar uma rota",
          ContentAlign.top,
          ShapeLightFocus.Circle),
    );
  }
}
