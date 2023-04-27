import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/repositories/product_data_repo/product_repo.dart';
import 'package:flutter_bloc_api/screens/home_screen.dart';

import 'bloc/product_bloc.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => ProductRepository(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(ProductRepository()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
