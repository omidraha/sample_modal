import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_modal/pages/home/bloc/home_bloc.dart';
import 'package:sample_modal/pages/home/bloc/home_event.dart';
import 'package:sample_modal/pages/home/screen/home.dart';
import 'package:sample_modal/repository/user_repository.dart';

void main() async {
  UserRepository userRepository = UserRepository();
  runApp(BlocProvider<HomeBloc>(
      create: (BuildContext context) {
        return HomeBloc(userRepository: userRepository)..add(LoadHomeData());
      },
      child: MyApp(userRepository: userRepository)));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({Key key, this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        // Home
        HomeScreen.routeName: (context) => BlocProvider<HomeBloc>(
            create: (BuildContext context) {
              return HomeBloc(userRepository: userRepository);
            },
            child: HomeScreen()),
      },
    );
  }
}
