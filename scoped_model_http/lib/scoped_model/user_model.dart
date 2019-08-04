import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserModel extends Model {
  List<User> _users = [];

  List<User> get users {
    return _users;
  }

  void fetchUsers() async {
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
        print(_users.length);
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }
}
