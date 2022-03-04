import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/bloc/user/user_cubit.dart';
import 'package:singleton/models/user.dart';

class Page2Page extends StatelessWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
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
              final user = User(
                name: 'Daniel',
                age: 29,
                professions: ['Proff 1', 'Proff 2'],
              );
              userCubit.selectUser(user);
            },
          ),
          MaterialButton(
            child: const Text(
              'Set age',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              userCubit.changeAge(999);
            },
          ),
          MaterialButton(
            child: const Text(
              'Add profession',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              userCubit.addPro();
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
