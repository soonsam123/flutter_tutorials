import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';

class UserModel extends Model {
  User _currentUser;

  void login(User user) {
    _currentUser = user;
  }

  User get currentUser {
    return _currentUser;
  }
}