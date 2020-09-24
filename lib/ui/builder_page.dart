import 'dart:async';

import 'package:flora/ui/login_page.dart';
import 'package:flora/ui/menu.dart';
import 'package:flora/utils/authentication_service.dart';
import 'package:flora/utils/authentication_state.dart';
import 'package:flora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuilderPage extends StatelessWidget {
  final StreamController<AuthenticationState> _streamController =
      StreamController<AuthenticationState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  AuthenticationService _authenticationService = new AuthenticationService();
  Future<String> _getMobileToken() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(Constants.STORAGE_TOKEN) ?? '';
  }

  Widget buildUi(BuildContext context, AuthenticationState s) {
    switch (s.state) {
      case "initial":
        {
          return Scaffold();
        }
        break;
      case "authenticated":
        {
          return Menu(_streamController);
        }
        break;
      case "failed":
        {
          return LoginPage(_streamController);
        }
    }
  }

  Future<AuthenticationState> checkAuthentication() async {
    String token = await _getMobileToken();
    if (token == '') {
      return AuthenticationState.failed();
    }
    var isAuthenticated = await _authenticationService.isAuthenticated(token);
    if (isAuthenticated) {
      return AuthenticationState.authenticated();
    }
    return AuthenticationState.failed();
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationState authState = AuthenticationState.initial();
    checkAuthentication().then((value) => _streamController.add(value));
    return StreamBuilder<AuthenticationState>(
        stream: _streamController.stream,
        initialData: authState,
        builder: (BuildContext context,
            AsyncSnapshot<AuthenticationState> snapshot) {
          final state = snapshot.data;
          return buildUi(context, state);
        });
  }
}
