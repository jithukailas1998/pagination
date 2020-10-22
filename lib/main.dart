import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/app.dart';
import 'package:pagination/observer.dart';

void main() {
  //
  Bloc.observer = BeerBlocObserver();
  runApp(MyApp());
}
