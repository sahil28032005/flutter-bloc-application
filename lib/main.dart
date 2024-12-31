import 'package:expence_tracker/blocs/auth/auth_bloc.dart';
import 'package:expence_tracker/screens/auth_screen.dart';
import 'package:expence_tracker/screens/dashboard.dart';
import 'package:expence_tracker/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/register',
          routes: {
            '/login': (context) => LoginScreen(),
            '/dashboard': (context) => DashboardScreen(),
            '/register': (context) => RegisterScreen(),
          },
        ));
  }
}
