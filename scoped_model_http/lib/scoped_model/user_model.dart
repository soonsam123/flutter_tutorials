import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserModel extends Model {
  List<User> _users = [];
  bool _isLoading = false;

  List<User> get users {
    return _users;
  }

  bool get isLoading {
    return _isLoading;
  }

  void fetchUsers() async {
    _isLoading = true;
    notifyListeners();
    try {
      http.Response response = await http.get('https://api.github.com/users');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<User> fetchedUserList = [];
        List<dynamic> responseData = jsonDecode(response.body);
        responseData?.forEach((dynamic userData) {
          final User user = User(userData['login'], userData['id'],
              userData['node_id'], userData['type']);
          fetchedUserList.add(user);
        });
        _users = fetchedUserList;
      }
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print(error);
      _isLoading = false;
      notifyListeners();
    }
  }
}
