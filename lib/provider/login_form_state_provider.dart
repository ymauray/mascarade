// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:pocketbase/pocketbase.dart';

@immutable
class LoginFormState {
  const LoginFormState({
    this.email = '',
    this.isRegistrationForm = false,
  });
  final String email;
  final bool isRegistrationForm;

  LoginFormState copyWith({
    String? email,
    bool? isRegistrationForm,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      isRegistrationForm: isRegistrationForm ?? this.isRegistrationForm,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'isRegistrationForm': isRegistrationForm,
    };
  }

  factory LoginFormState.fromMap(Map<String, dynamic> map) {
    return LoginFormState(
      email: map['email'] as String,
      isRegistrationForm: map['isRegistrationForm'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginFormState.fromJson(String source) =>
      LoginFormState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginFormState(email: $email, isRegistrationForm: $isRegistrationForm)';

  @override
  bool operator ==(covariant LoginFormState other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.isRegistrationForm == isRegistrationForm;
  }

  @override
  int get hashCode => email.hashCode ^ isRegistrationForm.hashCode;
}

class LoginFormStateNotifier extends StateNotifier<LoginFormState> {
  LoginFormStateNotifier(this._pocketBase) : super(const LoginFormState());

  final PocketBase _pocketBase;

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void toggleIsRegistrationForm() {
    state = state.copyWith(isRegistrationForm: !state.isRegistrationForm);
  }

  Future<bool> authenticate(String password) async {
    try {
      await _pocketBase
          .collection('users')
          .authWithPassword(state.email, password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(String password, String passwordConfirmation) async {
    try {
      await _pocketBase.collection('users').create(
        body: {
          'email': state.email,
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
