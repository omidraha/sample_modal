import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeData extends HomeEvent {}

class AddItemClicked extends HomeEvent {
  AddItemClicked();
}

class RemoveItemClicked extends HomeEvent {
  final int item;

  RemoveItemClicked({this.item});
}
