import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc_pattern/repositories/repositories.dart';
import 'package:bloc_pattern/models/models.dart';

class UsersRepository {
  final UsersApiClient usersApiClient;

  UsersRepository({@required this.usersApiClient})
      : assert(usersApiClient != null);

  Future<List<User>> getUsers() async {
    return await usersApiClient.fetchUsers();
  }
}
