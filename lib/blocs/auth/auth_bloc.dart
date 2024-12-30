import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    // Handle AuthLoginEvent
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        // Simulate authentication process
        await Future.delayed(Duration(seconds: 2));

        if (event.username == 'user' && event.password == 'password') {
          emit(AuthAuthenticatedState(userName: event.username));
        } else {
          emit(AuthErrorState(message: 'Invalid credentials'));
        }
      } catch (e) {
        emit(AuthErrorState(message: 'Authentication failed'));
      }
    });

    // Handle AuthLogoutEvent
    on<AuthLogoutEvent>((event, emit) {
      emit(AuthUnauthenticatedState());
    });
  }
}
