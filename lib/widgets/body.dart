import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/bloc/user_bloc.dart';
import 'package:pagination/bloc/user_state.dart';
import 'package:pagination/models/model.dart';
import 'package:pagination/widgets/loader.dart';

class UserBody extends StatefulWidget {
  @override
  _UserBodyState createState() => _UserBodyState();
}

class _UserBodyState extends State<UserBody> {
  final List<User> _users = [];

  final ScrollController _scrollController = ScrollController();
  var one;
  // UserBloc userBloc;

  // @override
  // void initState() {
  //   userBloc = BlocProvider.of(context);
  //   userBloc.add(UserFetchEvent());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, userState) {},
        builder: (context, userState) {
          if (userState is UserInitialState) {
            return ShimmerLoader();
          } else if (userState is UserLoadingState && _users.isEmpty) {
            return CircularProgressIndicator();
          } else if (userState is UserSuccessState) {
            print(userState.users);
            one = userState.users;
            return Text(one ?? 'noo data');
          } else if (userState is UserErrorState && _users.isEmpty) {
            return CircularProgressIndicator();
          }
          return Text(one ?? 'no data');

          // ListView.separated(
          //   controller: _scrollController
          //     ..addListener(() {
          //       if (_scrollController.offset ==
          //               _scrollController.position.maxScrollExtent &&
          //           !context.bloc<UserBloc>().isFetching) {
          //         print("caling again 2");
          //         context.bloc<UserBloc>()
          //           ..isFetching = true
          //           ..add(UserFetchEvent());
          //       }
          //     }),
          //   itemBuilder: (context, index) => UserItems(_users[index]),
          //   separatorBuilder: (context, index) => const SizedBox(height: 5),
          //   itemCount: _users.length,
          // );
        },
      ),
    );
  }
}
