import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/bloc/list_bloc/user_bloc.dart';
import 'package:pagination/bloc/list_bloc/user_event.dart';

class ErrorState extends StatefulWidget {
  @override
  _ErrorStateState createState() => _ErrorStateState();
}

class _ErrorStateState extends State<ErrorState> {
  UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          color: Colors.red,
          onPressed: () {
            userBloc.add(FetchUserEvent());
          },
          child: Text('Retry'),
        ),
      ),
    ));
  }
}
