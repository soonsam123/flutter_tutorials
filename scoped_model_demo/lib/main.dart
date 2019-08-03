import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './login.dart';
import './profile.dart';
import './scoped_model/user_model.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: _buildMaterialApp(),
    );
  }

  Widget _buildMaterialApp() {
    return MaterialApp(
      title: 'Scoped Model Demo',
      routes: {
        '/': (context) => LoginPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
