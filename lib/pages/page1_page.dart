import 'package:flutter/material.dart';
import 'package:singleton/models/user.dart';
// service
import 'package:singleton/services/user_service.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? InfoUser(user: snapshot.data)
              : Center(child: Text('No user'));
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

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Name: ${user!.name}'),
          ),
          ListTile(
            title: Text('Age: ${user!.age.toString()}'),
          ),
          Text(
            'Ocupations',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Profession 1'),
          ),
          ListTile(
            title: Text('Profession 2'),
          ),
        ],
      ),
    );
  }
}
