import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(ProductLoadedEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Fetched Product')),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is ProductErrorState) {
              return Text(state.errorMessage);
            } else if (state is ProductLoadedState) {
              return ListView.builder(
                  itemCount: state.productModel.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                        trailing: Image.network(
                            state.productModel[index].image.toString()),
                        subtitle: Text(
                            state.productModel[index].description.toString()),
                        title: Row(
                          children: [
                            Text(
                              state.productModel[index].id.toString(),
                            ),
                            Container(
                              color: Colors.amberAccent,
                              child: SizedBox(
                                width: 5,
                              ),
                            ),
                            Text(
                              state.productModel[index].title.toString(),
                            ),
                            Container(
                              color: Colors.amberAccent,
                              width: 5,
                            ),
                            Text(
                              state.productModel[index].category!.index
                                  .toString(),
                            ),
                            Container(
                              color: Colors.amberAccent,
                              width: 5,
                            ),
                            Text(
                              state.productModel[index].price.toString(),
                            ),
                            Container(
                              color: Colors.amberAccent,
                              width: 5,
                            ),
                            Text(
                              state.productModel[index].rating!.count
                                  .toString(),
                            ),
                          ],
                        ));
                  }));
            } else {
              return SizedBox();
            }
          },
        ));
  }
}
