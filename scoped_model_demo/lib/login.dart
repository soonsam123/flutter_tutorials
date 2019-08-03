import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './models/user.dart';
import './scoped_model/user_model.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ScopedModelDescendant<UserModel>(builder: (BuildContext context, Widget child, UserModel model) {
      return Center(
        child: RaisedButton(
          onPressed: () {
            var currentUser = User('Soon Santos', '22', 'Brazil');
            model.login(currentUser);
            Navigator.of(context).pushReplacementNamed('/profile');
          },
          child: Text('LOGIN'),
        ),
      );
    },);
  }
}
