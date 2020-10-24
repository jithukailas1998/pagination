import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pagination/models/model.dart';

abstract class UserState extends Equatable {}

class UserInitialState extends UserState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserLoadedState extends UserState {

  List<Data> data;

  UserLoadedState({@required this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class UserErrorState extends UserState {

  String message;

  UserErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}