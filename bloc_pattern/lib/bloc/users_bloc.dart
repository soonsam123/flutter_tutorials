import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc_pattern/bloc/users.dart';
import 'package:bloc_pattern/repositories/repositories.dart';
import 'package:bloc_pattern/models/models.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository usersRepository;

  UsersBloc({@required this.usersRepository}) : assert(usersRepository != null);

  @override
  UsersState get initialState => InitialUsersState();

  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async* {
    if (event is FetchUsers) {
      yield UsersLoading();
      try {
        final List<User> users = await usersRepository.getUsers();
        yield UsersLoaded(users: users);
      } catch (e) {
        print(e);
        yield UsersError();
      }
    }
  }
}
