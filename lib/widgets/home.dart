import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/bloc/user_bloc.dart';
import 'package:pagination/repos/repository.dart';
import 'package:pagination/widgets/body.dart';
import 'package:pagination/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        userRepository: UserRepository(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users'),
          backgroundColor: Colors.green,
          actions: <Widget>[
            new IconButton(
              icon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('value');
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
        body: UserBody(),
      ),
    );
  }
}
