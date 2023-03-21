import 'package:fastfoodapp/pages/login.dart';
import 'package:fastfoodapp/pages/register.dart';
import 'package:fastfoodapp/providers/registerProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => RegisterProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastFood App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Login.id,
      routes: {
        Login.id: (context) => Login(),
      },
    );
  }
}
