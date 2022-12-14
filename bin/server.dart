import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import '../api/product/controller/exceptions_controller.dart';
import '../api/product/controller/product_controller.dart';
import '../api/product/service/service_exceptions.dart';
import '../api/product/service/service_product.dart';

// Configure routes.
final _router = Router();

void main(List<String> args) async {
  final ServiceProductImpl serviceProductImpl = ServiceProductImpl();
  final ServiceExceptionsImpl serviceExceptionsImpl = ServiceExceptionsImpl();
  
  final ProductController productController = ProductController(serviceProductImpl);
  final ExceptionsController exceptionsController = ExceptionsController(serviceExceptionsImpl);

  _router.get('/products', (request) => productController.allProducts(request));
  // _router.get('/products', productController.allProducts);
  _router.get('/products/<id>', productController.productId);

  /// Estudo para tratar errors no front
  _router.get('/exceptions', exceptionsController.error);

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
