import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../service/service_exceptions.dart';

class ExceptionsController {
  final ServiceExceptionsImpl service;

  ExceptionsController(this.service);

  FutureOr<Response> error(Request request) async {
    try {
      final dynamic result = await service.exceptionsDefault();
      //  return Response.seeOther(
      //    "http://localhost:8080/exceptions",
      //   body: jsonEncode({'result': 'Teste de requisição $result'}),
      //   headers: {HttpHeaders.contentTypeHeader: "application/json"},
      // );
      //  return Response.movedPermanently(
      //    "http://localhost:8080/exceptions",
      //   body: jsonEncode({'result': 'Teste de requisição $result'}),
      //   headers: {HttpHeaders.contentTypeHeader: "application/json"},
      // );
      //  return Response.internalServerError(
      //   body: jsonEncode({'result': 'Teste de requisição $result'}),
      //   headers: {HttpHeaders.contentTypeHeader: "application/json"},
      // );
      // return Response.forbidden(
      //    jsonEncode({'result': 'Teste de requisição $result'}),
      //   headers: {HttpHeaders.contentTypeHeader: "application/json"},
      // );
      // return Response.badRequest(
      //   body: jsonEncode({'result': 'Teste de requisição $result'}),
      //   headers: {HttpHeaders.contentTypeHeader: "application/json"},
      // );
      // return Response.found(
      //   "http://localhost:8080/exceptions",
      //   body: jsonEncode({'result': 'Teste de requisição $result'}),
      //   headers: {HttpHeaders.contentTypeHeader: "application/json"},
      // );
      return Response.ok(
        jsonEncode({'result': 'Teste de requisição $result'}),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );
    } on Exception catch (e) {
      return Response(
        500,
        body: jsonEncode({
          'error': e.toString(),
        }),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
      );
    }
  }
}
