import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_marketplace_app/dummy_data/cart_dummy.dart';
import 'package:mini_marketplace_app/features/cart/cart.dart';
import 'package:mini_marketplace_app/features/catalog/catalog.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc(
            cart: CartState(cartItemList: List.from(myCartItem)),
          ),
        ),
        BlocProvider(create: (context) => CatalogBloc()..add(CatalogFetched())),
      ],
      child: const MaterialApp(
        home: CatalogPage(),
      ),
    );
  }
}
