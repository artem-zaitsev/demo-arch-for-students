import 'package:demo_app/src/modules/auth/ui/login_screen.dart';
import 'package:demo_app/src/modules/showroom/ui/order/order_screen.dart';
import 'package:demo_app/src/modules/showroom/ui/showroom/showroom_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black45),
          ),
          focusColor: Colors.black,
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (ctx) => LoginScreen(),
        '/showroom': (ctx) => ShowroomScreen(),
        '/order': (ctx) => OrderScreen(),
      },
    );
  }
}
