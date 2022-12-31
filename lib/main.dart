import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_marketplace_app/app.dart';
import 'package:mini_marketplace_app/simple_bloc_observer.dart';

void main() async {
  SimpleBlocObserver myObserver = SimpleBlocObserver();
  Bloc.observer = myObserver;
  runApp(const MyApp());
}
