import 'package:equatable/equatable.dart';

abstract class UsersEvent extends Equatable {
  UsersEvent([List props = const []]) : super(props);
}

class FetchUsers extends UsersEvent {}
