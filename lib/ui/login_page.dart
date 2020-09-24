import 'dart:async';

import 'package:flora/utils/authentication_service.dart';
import 'package:flora/utils/authentication_state.dart';
import 'package:flora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final StreamController<AuthenticationState> _streamController;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AuthenticationService _authenticationService = new AuthenticationService();

  LoginPage(this._streamController);

  /// ----------------------------------------------------------
  /// Method that saves the token in Shared Preferences
  /// ----------------------------------------------------------
  Future<bool> _setMobileToken(String token) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(Constants.STORAGE_TOKEN, token);
  }

  signIn() async {
    var result =
        await _authenticationService.login("admin@mail.ru", "password");
    if (result != null) {
      await _setMobileToken(result);
      _streamController.add(AuthenticationState.authenticated());
    } else {
      _streamController.add(AuthenticationState.failed());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in')),
      body: Center(
        child: RaisedButton(
          child: Text('Sign in'),
          onPressed: signIn,
        ),
      ),
    );
  }
}
