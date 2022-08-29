import 'package:ecommerce_sample/bloc/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_sample/bloc/item_bloc/item_bloc.dart';
import 'package:ecommerce_sample/views/cart_page.dart';
import 'package:ecommerce_sample/views/product_page.dart';
import 'package:ecommerce_sample/widgets/main_page_widgets/appbar_widget.dart';
import 'package:ecommerce_sample/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/item_model.dart';


void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ItemBloc>(create: (context) => ItemBloc()),
      BlocProvider<CartCubit>(create: (context) => CartCubit())
    ],
      child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFE7F6F2)),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/cart': (context) => CartPageWidget(),
        '/product': (context) => ProductPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MainPageWidget();
  }
}
