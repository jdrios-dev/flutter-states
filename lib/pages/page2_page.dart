import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton/models/user.dart';
import 'package:singleton/services/user_service.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userSerivice = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
            child: const Text(
              'Set user',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              final newUser = User(
                age: 25,
                professions: ['Tenedor', 'comedor'],
                name: 'Daniel',
              );
              userSerivice.user = newUser;
            },
          ),
          MaterialButton(
            child: const Text(
              'Set age',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              userSerivice.changeAge(999);
            },
          ),
          MaterialButton(
            child: const Text(
              'Add profession',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              userSerivice.addPro();
            },
          ),
          MaterialButton(
            child: const Text(
              'remove user',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              userSerivice.removeUser();
            },
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'page1'),
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
