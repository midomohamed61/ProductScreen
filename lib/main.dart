import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopescreen/core/DI/injection.dart';
import 'package:shopescreen/feature/home/presentation/manager/cubit/products_cubit.dart';
import 'package:shopescreen/feature/home/presentation/view/widgets/product_grid.dart';

void main() {
  InitGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getit<ProductsCubit>(),
        child: ProductGrid(),
      ),
    );
  }
}
