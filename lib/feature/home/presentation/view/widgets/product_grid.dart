import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopescreen/feature/home/data/model/products.dart';
import 'package:shopescreen/feature/home/presentation/manager/cubit/products_cubit.dart';
import 'package:shopescreen/feature/home/presentation/view/screens/shope_screen/product_card.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  List<Products> product = [];
  Products? products;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ProductsCubit>(context).emitGetAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is GetAllProducts) {
          product = state.products;
          return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.71,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: product.length,
            itemBuilder: (context, index) {
              final shoe = product[index];
              return ProductCard(
                name: product[index].title,
                price: shoe.price.toString(),
                oldPrice: shoe.price.toString(),
                rating: shoe.rating.rate.toString(),
                image: shoe.image,
              );
            },
          ),
        );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
        
      },
    );
  }
}
