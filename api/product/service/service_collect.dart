import '../../data_base/collect_data.dart';

abstract class ServiceCollect {
  List<dynamic> getListCollectsService();
}

class ServiceCollectImpl implements ServiceCollect {
  
  @override
  List<dynamic> getListCollectsService() => dataCollects;
}
