import '../../constants/fake_products.dart';
import '../model/product_model.dart';

abstract class ServiceProduct {
  Future<List<ProductModel>> findAllProduct();
  Future<ProductModel> findIdProduct(int id);
}

class ServiceProductImpl implements ServiceProduct {
  @override
  Future<List<ProductModel>> findAllProduct() async {
    await Future.delayed(Duration(milliseconds: 500));
    final List<ProductModel> productsData = products.map((e) => ProductModel.fromMap(e)).toList();
    return productsData;
  }

  @override
  Future<ProductModel> findIdProduct(int id) async {
    await Future.delayed(Duration(milliseconds: 500));
    final List<ProductModel> productsData = products.map((e) => ProductModel.fromMap(e)).toList();
    final result = productsData.firstWhere((ProductModel e) => e.id == id);
    return result;
  }
}
