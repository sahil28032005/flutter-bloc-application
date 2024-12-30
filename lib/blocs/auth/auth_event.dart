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

