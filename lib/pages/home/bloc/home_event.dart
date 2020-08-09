import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeData extends HomeEvent {}

class ItemClicked extends HomeEvent {
  final int item;

  ItemClicked({this.item});
}
