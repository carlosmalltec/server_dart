import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../service/service_collect.dart';

class CollectController {
  final ServiceCollectImpl serviceProductImpl;
  CollectController(this.serviceProductImpl);

  FutureOr<Response> getListCollectsController(Request request, String driverId) async {
    try {
      return _listCollects();
    } on Exception catch (e) {
      return Response(
        500,
        body: jsonEncode({'error': e}),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );
    }
  }

  FutureOr<Response> _listCollects() {
    final List<dynamic> result = serviceProductImpl.getListCollectsService();
    return Response.ok(
      jsonEncode({'result': result}),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
  }
}
