import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_pattern/models/models.dart';

abstract class UsersState extends Equatable {
  UsersState([List props = const []]) : super(props);
}

class InitialUsersState extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<User> users;

  UsersLoaded({@required this.users})
      : assert(users != null),
        super([users]);
}

class UsersError extends UsersState {}
