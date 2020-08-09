import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_modal/repository/user_repository.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;
  List items;

  HomeBloc({this.userRepository}) : super(HomeDataIsLoading());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    print('HomeBloc.mapEventToState: $event');

    if (event is LoadHomeData) {
      items = await userRepository.getItems();
    }

    if (event is ItemClicked) {
      await userRepository.removeItem(item: event.item);
    }

    print('HomeBloc.items: $items');
    yield HomeDataLoaded(items: items, count: items.length);
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
