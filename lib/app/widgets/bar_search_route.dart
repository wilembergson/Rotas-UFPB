import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:routes_ufpb/app/map_polyline/map_polyline_store.dart';
import 'package:routes_ufpb/app/widgets/search_filter.dart';
import 'package:routes_ufpb/app/widgets/target_custom.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class BarSearchRoute extends StatefulWidget {
  final MapPolylineStore store;

  const BarSearchRoute({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  State<BarSearchRoute> createState() => _BarSearchRouteState();
}

class _BarSearchRouteState extends State<BarSearchRoute> {
  GlobalKey searchStartKey = GlobalKey();

  GlobalKey searchEndKey = GlobalKey();

  GlobalKey showRouteKey = GlobalKey();

  List<TargetFocus> targets = <TargetFocus>[];

  @override
  void initState() {
    super.initState();
    initTargets();

    widget.store.showTutorialBar(context, targets);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SafeArea(
          child: Container(
        color: Colors.white.withOpacity(0.5),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              key: searchStartKey,
              padding: const EdgeInsets.only(top: 20),
              child: SearchFilter(
                hint: "Local de partida",
                controller: widget.store.startControler,
                onChanged: widget.store.filter,
                points: widget.store.pointsFilter,
                onSelected: widget.store.setPointStart,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SearchFilter(
                  key: searchEndKey,
                  hint: "Local de destino",
                  controller: widget.store.endControler,
                  onChanged: widget.store.filterEnd,
                  points: widget.store.pointsEnd,
                  onSelected: widget.store.setPointEnd,
                )),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              key: showRouteKey,
              onTap: () async {
                await widget.store.getPolyline(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    "Mostrar Rota",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ));
    });
  }

  void initTargets() {
    targets.clear();

    targets.add(TargetCustom().call(
        "searchStartKey",
        searchStartKey,
        "Buscar ponto de origem",
        "Procure pelo predio de origem aqui!",
        ContentAlign.bottom,
        ShapeLightFocus.RRect));

    targets.add(TargetCustom().call(
        "searchEndKey",
        searchEndKey,
        "Buscar ponto de destino",
        "Procure pelo predio de destino aqui!",
        ContentAlign.bottom,
        ShapeLightFocus.RRect));

    targets.add(TargetCustom().call(
        "showRouteKey",
        showRouteKey,
        "Botão para mostra rota",
        "Para mostrar a rota no mapa, clique aqui após selecionar os pontos de origem e destino!",
        ContentAlign.bottom,
        ShapeLightFocus.RRect));
  }
}
