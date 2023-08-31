import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import '../api/product/controller/reasons_controller.dart';
import '../api/product/service/service_reasons.dart';

// Configure routes.
final _router = Router();

void main(List<String> args) async {
  // final ServiceProductImpl serviceProductImpl = ServiceProductImpl();
  final serviceReasonsImpl = ServiceReasonsImpl();
  // final ServiceExceptionsImpl serviceExceptionsImpl = ServiceExceptionsImpl();

  final reasonsController = ReasonsController(serviceReasonsImpl);
  // final ProductController productController = ProductController(serviceProductImpl);
  // final ExceptionsController exceptionsController = ExceptionsController(serviceExceptionsImpl);

////reasons/{stepSlug}
  _router.get('/reasons/<stepSlug>', reasonsController.reasons);
  _router.get('/justifications', reasonsController.getJustifications);

  // _router.get('/products', (request) => productController.allProducts(request));
  // _router.get('/products', productController.allProducts);
  // _router.get('/products/<id>', productController.productId);

  /// Estudo para tratar errors no front
  // _router.get('/exceptions', exceptionsController.error);

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
