import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/bloc/user/user_cubit.dart';
import 'package:singleton/pages/page1_page.dart';
import 'package:singleton/pages/page2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserCubit(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Singleton App',
          initialRoute: 'page1',
          routes: {
            'page1': (_) => Page1Page(),
            'page2': (_) => Page2Page(),
          }),
    );
  }
}
