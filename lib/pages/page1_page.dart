import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/bloc/user/user_bloc.dart';
import 'package:singleton/models/user.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(DeleteUser());
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state.existUser) {
            return InfoUser(user: state.user!);
          } else {
            return Center(
              child: Text('No data'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'page2'),
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class InfoUser extends StatelessWidget {
  const InfoUser({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Name: ${user.name}'),
          ),
          ListTile(
            title: Text('Age: ${user.age}'),
          ),
          Text(
            'Ocupations ${user.professions.length}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Profession 1'),
          ),
        ],
      ),
    );
  }
}
