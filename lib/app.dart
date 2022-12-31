import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_marketplace_app/cart/bloc/cart_bloc.dart';
import 'package:mini_marketplace_app/catalog/catalog.dart';
import 'package:mini_marketplace_app/dummy_data/cart_dummy.dart';

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
