import 'package:expence_tracker/blocs/auth/auth_bloc.dart';
import 'package:expence_tracker/blocs/auth/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Trigger logout event
              BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome to your Dashboard!",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
