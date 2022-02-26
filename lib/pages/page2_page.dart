import 'package:flutter/material.dart';
import 'package:singleton/models/user.dart';
import 'package:singleton/services/user_service.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? Text(snapshot.data!.name)
                : Text('Page 2');
          },
        ),
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
                name: 'Daniel',
                age: 25,
                professions: ['Developer', 'MBA'],
              );
              userService.loadUser(newUser);
            },
          ),
          MaterialButton(
            child: const Text(
              'Set age',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              userService.changeAge(999);
            },
          ),
          MaterialButton(
            child: const Text(
              'Add profession',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {},
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
