import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import '../api/product/controller/collect_controller.dart';
import '../api/product/controller/delivery_controller.dart';
import '../api/product/controller/reasons_controller.dart';
import '../api/product/service/service_collect.dart';
import '../api/product/service/service_delivery.dart';
import '../api/product/service/service_reasons.dart';

// Configure routes.
final _router = Router();

void main(List<String> args) async {
  final reasonsController = ReasonsController(ServiceReasonsImpl());
  final collectController = CollectController(ServiceCollectImpl());
  final deliveryController = DeliveryController(ServiceDeliveryImpl());

  /// reasons/{stepSlug}
  _router.get('/reasons/<stepSlug>', reasonsController.reasons);
  _router.get('/justifications', reasonsController.getJustifications);
  _router.get(
      '/collects/<driverId>', collectController.getListCollectsController);
  _router.get(
      '/deliveries/<driverId>', deliveryController.getListDeliveryController);

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  // 'http://192.168.18.14:8090'; => 14 dinamico entao muda
  // terminal => ifconfig => procurar por broadcast 192.168.18.255 => inet 192.168.18.14 netmask 0xffffff00 broadcast 192.168.18.255
  final port = int.parse(Platform.environment['PORT'] ?? '8090');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
