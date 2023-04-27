import 'package:flutter/material.dart';
import 'package:flutter_bloc_api/screens/product_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc api practice')),
      body: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ProductPage();
            }));
          },
          child: const Text(
            'Fetch Data',
            style: TextStyle(fontSize: 30),
          )),
    );
  }
}
