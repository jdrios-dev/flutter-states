import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton/pages/page1_page.dart';
import 'package:singleton/pages/page2_page.dart';
import 'package:singleton/services/user_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserService(),
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
