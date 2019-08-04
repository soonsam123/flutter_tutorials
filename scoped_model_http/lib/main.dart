import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'users.dart';
import './scoped_model/user_model.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = UserModel();
    return ScopedModel<UserModel>(
      model: model,
      child: _buildMaterialApp(model),
    );
  }

  MaterialApp _buildMaterialApp(UserModel model) {
    return MaterialApp(
      title: 'Scoped Model Http',
      routes: {
        '/': (context) => UsersPage(model),
      },
    );
  }
}
