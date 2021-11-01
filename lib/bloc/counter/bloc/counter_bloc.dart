import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example_flutter/models/product.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());
  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is OnShowData) {
      final List<Product> _allproducts = List.generate(
        25,
        (index) {
          return Product(
            id: "id_${index + 1}",
            title: "Product ${index + 1}",
            description: 'Ini adalah deskripsi produk ${index + 1}',
            price: (10 + Random().nextInt(100)).toDouble(),
            imageUrl: "",
          );
        },
      );
      yield CounterSuccessGetData(_allproducts);
    }
  }
}
