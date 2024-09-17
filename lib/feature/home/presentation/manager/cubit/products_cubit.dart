
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopescreen/feature/home/data/api/my_repo.dart';
import 'package:shopescreen/feature/home/data/model/products.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.myRepo) : super(ProductsInitial());
  final MyRepo myRepo ;

  void emitGetAllProducts() async {
  emit(ProductsLoading());
  final products = await myRepo.getAllProducts();
  emit(GetAllProducts(products: products));
}
}
