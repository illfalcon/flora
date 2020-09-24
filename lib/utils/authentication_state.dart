class AuthenticationState {
  final String state;

  AuthenticationState.initial({this.state = "initial"});

  AuthenticationState.authenticated({this.state = "authenticated"});

  AuthenticationState.failed({this.state = "failed"});

  AuthenticationState.signedOut({this.state = "signedOut"});
}