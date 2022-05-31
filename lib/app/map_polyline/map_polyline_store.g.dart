// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_polyline_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapPolylineStore on _MapPolylineStoreBase, Store {
  late final _$markersAtom =
      Atom(name: '_MapPolylineStoreBase.markers', context: context);

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  late final _$polylineAtom =
      Atom(name: '_MapPolylineStoreBase.polyline', context: context);

  @override
  Set<Polyline> get polyline {
    _$polylineAtom.reportRead();
    return super.polyline;
  }

  @override
  set polyline(Set<Polyline> value) {
    _$polylineAtom.reportWrite(value, super.polyline, () {
      super.polyline = value;
    });
  }

  late final _$pointsAtom =
      Atom(name: '_MapPolylineStoreBase.points', context: context);

  @override
  List<Point> get points {
    _$pointsAtom.reportRead();
    return super.points;
  }

  @override
  set points(List<Point> value) {
    _$pointsAtom.reportWrite(value, super.points, () {
      super.points = value;
    });
  }

  late final _$pointsFilterAtom =
      Atom(name: '_MapPolylineStoreBase.pointsFilter', context: context);

  @override
  List<Point> get pointsFilter {
    _$pointsFilterAtom.reportRead();
    return super.pointsFilter;
  }

  @override
  set pointsFilter(List<Point> value) {
    _$pointsFilterAtom.reportWrite(value, super.pointsFilter, () {
      super.pointsFilter = value;
    });
  }

  late final _$pointsEndAtom =
      Atom(name: '_MapPolylineStoreBase.pointsEnd', context: context);

  @override
  List<Point> get pointsEnd {
    _$pointsEndAtom.reportRead();
    return super.pointsEnd;
  }

  @override
  set pointsEnd(List<Point> value) {
    _$pointsEndAtom.reportWrite(value, super.pointsEnd, () {
      super.pointsEnd = value;
    });
  }

  late final _$routesLineAtom =
      Atom(name: '_MapPolylineStoreBase.routesLine', context: context);

  @override
  List<RouteLine> get routesLine {
    _$routesLineAtom.reportRead();
    return super.routesLine;
  }

  @override
  set routesLine(List<RouteLine> value) {
    _$routesLineAtom.reportWrite(value, super.routesLine, () {
      super.routesLine = value;
    });
  }

  late final _$visibleRouteAtom =
      Atom(name: '_MapPolylineStoreBase.visibleRoute', context: context);

  @override
  bool get visibleRoute {
    _$visibleRouteAtom.reportRead();
    return super.visibleRoute;
  }

  @override
  set visibleRoute(bool value) {
    _$visibleRouteAtom.reportWrite(value, super.visibleRoute, () {
      super.visibleRoute = value;
    });
  }

  late final _$startAtom =
      Atom(name: '_MapPolylineStoreBase.start', context: context);

  @override
  Point? get start {
    _$startAtom.reportRead();
    return super.start;
  }

  @override
  set start(Point? value) {
    _$startAtom.reportWrite(value, super.start, () {
      super.start = value;
    });
  }

  late final _$endAtom =
      Atom(name: '_MapPolylineStoreBase.end', context: context);

  @override
  Point? get end {
    _$endAtom.reportRead();
    return super.end;
  }

  @override
  set end(Point? value) {
    _$endAtom.reportWrite(value, super.end, () {
      super.end = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MapPolylineStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$startControlerAtom =
      Atom(name: '_MapPolylineStoreBase.startControler', context: context);

  @override
  TextEditingController get startControler {
    _$startControlerAtom.reportRead();
    return super.startControler;
  }

  @override
  set startControler(TextEditingController value) {
    _$startControlerAtom.reportWrite(value, super.startControler, () {
      super.startControler = value;
    });
  }

  late final _$endControlerAtom =
      Atom(name: '_MapPolylineStoreBase.endControler', context: context);

  @override
  TextEditingController get endControler {
    _$endControlerAtom.reportRead();
    return super.endControler;
  }

  @override
  set endControler(TextEditingController value) {
    _$endControlerAtom.reportWrite(value, super.endControler, () {
      super.endControler = value;
    });
  }

  late final _$appVersionAtom =
      Atom(name: '_MapPolylineStoreBase.appVersion', context: context);

  @override
  String get appVersion {
    _$appVersionAtom.reportRead();
    return super.appVersion;
  }

  @override
  set appVersion(String value) {
    _$appVersionAtom.reportWrite(value, super.appVersion, () {
      super.appVersion = value;
    });
  }

  late final _$setSegmentAsyncAction =
      AsyncAction('_MapPolylineStoreBase.setSegment', context: context);

  @override
  Future<void> setSegment() {
    return _$setSegmentAsyncAction.run(() => super.setSegment());
  }

  late final _$getPolylineAsyncAction =
      AsyncAction('_MapPolylineStoreBase.getPolyline', context: context);

  @override
  Future getPolyline(BuildContext context) {
    return _$getPolylineAsyncAction.run(() => super.getPolyline(context));
  }

  late final _$getAppVersionAsyncAction =
      AsyncAction('_MapPolylineStoreBase.getAppVersion', context: context);

  @override
  Future getAppVersion() {
    return _$getAppVersionAsyncAction.run(() => super.getAppVersion());
  }

  late final _$_MapPolylineStoreBaseActionController =
      ActionController(name: '_MapPolylineStoreBase', context: context);

  @override
  dynamic setVisibleRoute() {
    final _$actionInfo = _$_MapPolylineStoreBaseActionController.startAction(
        name: '_MapPolylineStoreBase.setVisibleRoute');
    try {
      return super.setVisibleRoute();
    } finally {
      _$_MapPolylineStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPointStart(Point point) {
    final _$actionInfo = _$_MapPolylineStoreBaseActionController.startAction(
        name: '_MapPolylineStoreBase.setPointStart');
    try {
      return super.setPointStart(point);
    } finally {
      _$_MapPolylineStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPointEnd(Point point) {
    final _$actionInfo = _$_MapPolylineStoreBaseActionController.startAction(
        name: '_MapPolylineStoreBase.setPointEnd');
    try {
      return super.setPointEnd(point);
    } finally {
      _$_MapPolylineStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filter(String filter) {
    final _$actionInfo = _$_MapPolylineStoreBaseActionController.startAction(
        name: '_MapPolylineStoreBase.filter');
    try {
      return super.filter(filter);
    } finally {
      _$_MapPolylineStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterEnd(String filter) {
    final _$actionInfo = _$_MapPolylineStoreBaseActionController.startAction(
        name: '_MapPolylineStoreBase.filterEnd');
    try {
      return super.filterEnd(filter);
    } finally {
      _$_MapPolylineStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
markers: ${markers},
polyline: ${polyline},
points: ${points},
pointsFilter: ${pointsFilter},
pointsEnd: ${pointsEnd},
routesLine: ${routesLine},
visibleRoute: ${visibleRoute},
start: ${start},
end: ${end},
isLoading: ${isLoading},
startControler: ${startControler},
endControler: ${endControler},
appVersion: ${appVersion}
    ''';
  }
}
