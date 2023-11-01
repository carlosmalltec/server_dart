import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../service/service_delivery.dart';


class DeliveryController {
  final ServiceDeliveryImpl serviceProductImpl;
  DeliveryController(this.serviceProductImpl);

  FutureOr<Response> getListDeliveryController(
      Request request, String driverId) async {
    try {
      // await Future.delayed(Duration(seconds: 30));
      return _listDelivery();
    } on Exception catch (e) {
      return Response(
        500,
        body: jsonEncode({'error': e}),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );
    }
  }

  FutureOr<Response> _listDelivery() {
    final List<dynamic> result = serviceProductImpl.getListDeliveryService();
    return Response.ok(
      jsonEncode({'result': result}),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
  }
}
