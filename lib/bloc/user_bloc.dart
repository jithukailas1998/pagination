import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pagination/bloc/user_event.dart';
import 'package:pagination/bloc/user_state.dart';
import 'package:pagination/models/model.dart';
import 'package:pagination/repos/repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

  UserRepository repository;

  UserBloc({@required this.repository}) : super(null) ;

  @override
  // TODO: implement initialState
  UserState get initialState => UserInitialState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUserEvent) {
      yield UserLoadingState();
      try {
        List<Data> users = await repository.getUsers();
        yield UserLoadedState(data: users);
      } catch (e) {
        yield UserErrorState(message: e.toString());
      }
    }
  }

}