import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../service/service_reasons.dart';

class ReasonsController {
  final ServiceReasonsImpl serviceReasonsImpl;
  ReasonsController(this.serviceReasonsImpl);

  final List<String> steps = ['justifications', 'arrived', 'way', 'listing'];

  FutureOr<Response> reasons(Request request, String stepSlug) async {
    try {
      if (steps.contains(stepSlug)) {
        if (stepSlug == 'way') return way();
        if (stepSlug == 'arrived') return arrived();
        if (stepSlug == 'listing') return listing();
      }
      return routeForbidden();
    } on Exception catch (e) {
      return Response(
        500,
        body: jsonEncode({'error': e}),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );
    }
  }

  FutureOr<Response> getJustifications(Request request) async {
    try {
      return justifications();
    } on Exception catch (e) {
      return Response(
        500,
        body: jsonEncode({'error': e}),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );
    }
  }

  FutureOr<Response> listing() {
    final List<dynamic> listing = serviceReasonsImpl.getReasonsListing();
    return Response.ok(
      jsonEncode({'result': listing}),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
  }

  FutureOr<Response> way() {
    final List<dynamic> way = serviceReasonsImpl.getReasonsWay();
    return Response.ok(
      jsonEncode({'result': way}),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
  }

  FutureOr<Response> arrived() {
    final List<dynamic> arrived = serviceReasonsImpl.getReasonsArrived();
    return Response.ok(
      jsonEncode({'result': arrived}),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
  }

  FutureOr<Response> justifications() {
    final List<dynamic> justifications =
        serviceReasonsImpl.getReasonsJustifications();
    return Response.ok(
      jsonEncode({'result': justifications}),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
  }

  FutureOr<Response> routeForbidden() {
    return Response.forbidden(
      jsonEncode({
        'result': {"message": "Rota não encontrada, verifique!"}
      }),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
  }
}
