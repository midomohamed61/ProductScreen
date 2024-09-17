import 'package:shopescreen/feature/home/data/model/products.dart';
import 'package:shopescreen/feature/home/data/api/web_services.dart';

class MyRepo{
final WebServices webServices;
MyRepo(this.webServices);
  Future<List<Products>> getAllProducts() async {
    return await webServices.getAllProducts();
}
} 