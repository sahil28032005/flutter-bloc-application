// lib/blocs/auth/auth_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

// handles auth events and emits states basde on events

// yield is used in Dart when working with asynchronous streams (a sequence of values over time).
//when authblock starts initial state is set to authInitial state
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState());
  //this method listens for incoming events and maps to state
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLoginEvent) {
      print('in auth_bloc emitting authloading state');
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

//quick notes:
// It’s like return, but instead of finishing the function, it gives a value to the stream and keeps the function alive for further execution.