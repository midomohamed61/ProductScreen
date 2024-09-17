import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:shopescreen/feature/home/data/model/products.dart';
part 'web_services.g.dart';

@RestApi(baseUrl: "https://fakestoreapi.com/")
abstract class WebServices{
  factory WebServices(Dio dio,{String baseUrl}) = _WebServices ;

  @GET("products")
  Future<List<Products>> getAllProducts() ;
}