abstract class AuthState {}

//will be an inital state when no an =y authentication done at at tie of splash or any
class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthAuthenticatedState extends AuthState {
  final String userName;

  AuthAuthenticatedState({required this.userName});
}

class AuthUnauthenticatedState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});
}