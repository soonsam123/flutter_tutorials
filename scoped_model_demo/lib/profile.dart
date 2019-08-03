import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './scoped_model/user_model.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ScopedModelDescendant<UserModel>(
      builder: (BuildContext context, Widget child, UserModel model) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(model.currentUser.name),
              Text(model.currentUser.age),
              Text(model.currentUser.country),
            ],
          ),
        );
      },
    );
  }
}
