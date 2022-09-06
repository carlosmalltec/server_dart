import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../model/product_model.dart';
import '../service/service_product.dart';

class ProductController {
  final ServiceProductImpl serviceProductImpl;
  ProductController(this.serviceProductImpl);

  FutureOr<Response> allProducts(Request request) async {
    try {
      final List<ProductModel> result = await serviceProductImpl.findAllProduct();
      return Response.ok(
        jsonEncode({'result': result.map((e) => e.toMap()).toList()}),
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

  FutureOr<Response> productId(Request request, String id) async {
    try {
      final productId = int.parse(id.toString());
      final ProductModel result = await serviceProductImpl.findIdProduct(productId);
      return Response(
        200,
        body: jsonEncode({'result': result.toMap()}),
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
