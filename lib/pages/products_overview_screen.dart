import 'package:example_flutter/bloc/counter/bloc/counter_bloc.dart';
import 'package:example_flutter/components/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

CounterBloc counterBloc = CounterBloc();

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    print("ProductsOverviewScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: BlocBuilder(
        bloc: counterBloc,
        builder: (context, state) {
          if (state is CounterInitial) {
            counterBloc.add(OnShowData());
          } else if (state is CounterSuccessGetData) {
            print("ada di state success");
            return ProductGrid(allproduct: state.dataProduct);
          }
          return Center();
        },
      ),
    );
  }
}
