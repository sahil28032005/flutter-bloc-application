//this will serve base class for all from which other classes add their extensions and its object is cant be craeted as it is abrs=stract class
abstract class AuthEvent {}

//login event
class AuthLoginEvent extends AuthEvent {
  final String username;
  final String password;

  AuthLoginEvent({required this.username, required this.password});
}

//logout event
class AuthLogoutEvent extends AuthEvent {}

//register event
class AuthRegisterEvent extends AuthEvent {
  final String username;
  final String password;
  final String email;

  AuthRegisterEvent(
      {required this.username, required this.password, required this.email});
}

//fogot password evnent
class AuthForgotPasswordEvent extends AuthEvent {
  final String email;

  AuthForgotPasswordEvent({required this.email});
}

//authCheckEvent
class AuthCheckEvent extends AuthEvent {}
