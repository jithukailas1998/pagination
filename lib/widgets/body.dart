import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/bloc/user_bloc.dart';
import 'package:pagination/bloc/user_event.dart';
import 'package:pagination/bloc/user_state.dart';
import 'package:pagination/models/model.dart';
import 'package:pagination/widgets/error.dart';
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
    return Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Users"),
                centerTitle: true,
                backgroundColor: Colors.red,
                actions: <Widget>[
                  
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
                    
                  },
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserInitialState) {
                        return ShimmerLoader();
                      } else if (state is UserLoadingState) {
                        return ShimmerLoader();
                      } else if (state is UserLoadedState) {
                        return buildUserList(state.data);
                      } else if (state is UserErrorState) {
                        return ErrorState();
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ),
          );
        },
    );
  }


  Widget buildUserList(List<Data> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: ListTile(
              leading: Image.network(
                data[pos].avatar,
              ),
              title: Row(
                children: [
                  Text(data[pos].firstName),
                  SizedBox(width: 10),
                  Text(data[pos].lastName),
                ],
              ),
              subtitle: Text(data[pos].email),
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
