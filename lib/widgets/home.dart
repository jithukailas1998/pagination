import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/bloc/list_bloc/user_bloc.dart';
import 'package:pagination/repos/repository.dart';
import 'package:pagination/widgets/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(repository: UserRepo()),
      child: HomePage(),
    );
  }
}
