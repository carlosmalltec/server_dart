import '../../data_base/reasons_arrived.dart';
import '../../data_base/reasons_justifications.dart';
import '../../data_base/reasons_listing.dart';
import '../../data_base/reasons_way.dart';

abstract class ServiceReasons {
  List<dynamic> getReasonsListing();
  List<dynamic> getReasonsWay();
  List<dynamic> getReasonsArrived();
  List<dynamic> getReasonsJustifications();
}

class ServiceReasonsImpl implements ServiceReasons {
  @override
  List<dynamic> getReasonsListing() => reasonsListing;

  @override
  List getReasonsArrived() => reasonsArrived;

  @override
  List getReasonsWay() => reasonsWay;

  @override
  List getReasonsJustifications() => reasonsJustifications;
}
