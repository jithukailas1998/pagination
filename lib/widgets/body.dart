import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/bloc/user_bloc.dart';
import 'package:pagination/bloc/user_event.dart';
import 'package:pagination/bloc/user_state.dart';
import 'package:pagination/models/model.dart';
import 'package:pagination/widgets/loader.dart';
import 'package:pagination/widgets/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.add(FetchUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Users"),
                centerTitle: true,
                backgroundColor: Colors.red,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      userBloc.add(FetchUserEvent());
                    },
                  ),
                  new IconButton(
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('value');
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                  ),
                ],
              ),
              body: Container(
                child: BlocListener<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UserErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserInitialState) {
                        return ShimmerLoader();
                      } else if (state is UserLoadingState) {
                        return ShimmerLoader();
                      } else if (state is UserLoadedState) {
                        return buildArticleList(state.data);
                      } else if (state is UserErrorState) {
                        return buildErrorUi(state.message);
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  Widget buildErrorUi(String message) {
    return Center(
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
    );
  }

  Widget buildArticleList(List<Data> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ListTile(
              leading: Text("{data[pos].id}"),
              title: Text(data[pos].email),
              subtitle: Text(""),
            ),
            onTap: () {
              //navigateToArticleDetailPage(context, data[pos]);
            },
          ),
        );
      },
    );
  }
}
