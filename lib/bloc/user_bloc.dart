import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pagination/bloc/user_event.dart';
import 'package:pagination/bloc/user_state.dart';
import 'package:pagination/repos/repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  int page = 1;
  bool isFetching = false;

  UserBloc({
    @required this.userRepository,
  }) : super(UserInitialState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    print("Current Event is $event");
    if (event is UserFetchEvent) {
      yield UserLoadingState(message: 'Loading...');
      final response = await userRepository.getUsers(page: page);
      // all check

      yield UserSuccessState(
        users: response,
      );
    }
  }
}
