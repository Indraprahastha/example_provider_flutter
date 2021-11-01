part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {}

class CounterSuccessGetData extends CounterState {
  final List<Product> dataProduct;

  const CounterSuccessGetData(this.dataProduct);
}

class TestState extends CounterState {}
