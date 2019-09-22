import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_pattern/bloc/users.dart';
import 'package:bloc_pattern/repositories/repositories.dart';
import 'package:bloc_pattern/models/models.dart';

main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersRepository usersRepository = UsersRepository(
      usersApiClient: UsersApiClient(httpClient: http.Client()),
    );
    return MaterialApp(
      title: 'Github Users Bloc',
      home: UsersPage(
        usersRepository: usersRepository,
      ),
    );
  }
}

class UsersPage extends StatefulWidget {
  final UsersRepository usersRepository;

  const UsersPage({Key key, this.usersRepository}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  UsersBloc _usersBloc;

  @override
  void initState() {
    _usersBloc = UsersBloc(usersRepository: widget.usersRepository);
    _usersBloc.dispatch(FetchUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Users'),
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
          bloc: _usersBloc,
          builder: (context, state) {
            if (state is UsersLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UsersLoaded) {
              return _buildListView(state.users);
            }
            if (state is UsersError) {
              return Center(
                child: Text('Error :('),
              );
            }
            return Container();
          }),
    );
  }

  ListView _buildListView(List<User> users) {
    return ListView.builder(
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(users[i].login),
          subtitle: Text(users[i].id.toString()),
        );
      },
      itemCount: users.length,
    );
  }

  @override
  void dispose() {
    _usersBloc.dispose();
    super.dispose();
  }


}
