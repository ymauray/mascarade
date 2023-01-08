// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:pocketbase/pocketbase.dart';

@immutable
class LoginFormState {
  const LoginFormState({
    this.username = '',
    this.isRegistrationForm = false,
  });

  final String username;
  final bool isRegistrationForm;

  LoginFormState copyWith({
    String? username,
    bool? isRegistrationForm,
  }) {
    return LoginFormState(
      username: username ?? this.username,
      isRegistrationForm: isRegistrationForm ?? this.isRegistrationForm,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'isRegistrationForm': isRegistrationForm,
    };
  }

  factory LoginFormState.fromMap(Map<String, dynamic> map) {
    return LoginFormState(
      username: map['username'] as String,
      isRegistrationForm: map['isRegistrationForm'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginFormState.fromJson(String source) =>
      LoginFormState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginFormState(username: $username, isRegistrationForm: $isRegistrationForm)';

  @override
  bool operator ==(covariant LoginFormState other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.isRegistrationForm == isRegistrationForm;
  }

  @override
  int get hashCode => username.hashCode ^ isRegistrationForm.hashCode;
}

class LoginFormStateNotifier extends StateNotifier<LoginFormState> {
  LoginFormStateNotifier(this._pocketBase) : super(const LoginFormState());

  final PocketBase _pocketBase;

  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void toggleIsRegistrationForm() {
    state = state.copyWith(isRegistrationForm: !state.isRegistrationForm);
  }

  Future<bool> authenticate(String password) async {
    try {
      await _pocketBase
          .collection('users')
          .authWithPassword(state.username, password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(String password, String passwordConfirmation) async {
    try {
      await _pocketBase.collection('users').create(
        body: {
          'username': state.username,
          'password': password,
          'passwordConfirm': passwordConfirmation
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}

final loginFormStateProvider =
    StateNotifierProvider<LoginFormStateNotifier, LoginFormState>((ref) {
  return LoginFormStateNotifier(
    ref.read(pocketBaseProvider),
  );
});
