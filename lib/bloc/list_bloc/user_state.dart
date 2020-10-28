import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pagination/models/model.dart';

abstract class UserState extends Equatable {}

class UserInitialState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class UserLoadedState extends UserState {
  List<Data> data;

  UserLoadedState({@required this.data});

  @override
  List<Object> get props => [data];
}

// ignore: must_be_immutable
class UserErrorState extends UserState {
  String message;

  UserErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
