// lib/blocs/auth/auth_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLoginEvent) {
      yield AuthLoadingState();
      try {
        // Simulate authentication process
        await Future.delayed(Duration(seconds: 2));

        if (event.username == 'user' && event.password == 'password') {
          yield AuthAuthenticatedState(userName: event.username);
        } else {
          yield AuthErrorState(message: 'Invalid credentials');
        }
      } catch (e) {
        yield AuthErrorState(message: 'Authentication failed');
      }
    } else if (event is AuthLogoutEvent) {
      yield AuthUnauthenticatedState();
    }
  }
}
