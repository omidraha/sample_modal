import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeDataIsLoading extends HomeState {}

class HomeDataLoaded extends HomeState {
  final List items;
  final int count;
  HomeDataLoaded({this.items, this.count});

  @override
  List<Object> get props => [this.items, this.count];
}
