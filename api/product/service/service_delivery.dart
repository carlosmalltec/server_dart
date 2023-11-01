import '../../data_base/delivery_data.dart';

abstract class ServiceDelivery {
  List<dynamic> getListDeliveryService();
}

class ServiceDeliveryImpl implements ServiceDelivery {
  
  @override
  List<dynamic> getListDeliveryService() => dataDelivery;
}

