import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable{}

class FetchUserEvent extends UserEvent {
  @override
  List<Object> get props => null;
}