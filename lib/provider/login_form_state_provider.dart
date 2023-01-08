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
    this.isBusy = false,
    this.info = '',
    this.error = '',
  });

  final String username;
  final bool isRegistrationForm;
  final bool isBusy;
  final String info;
  final String error;

  LoginFormState copyWith({
    String? username,
    bool? isRegistrationForm,
    bool? isBusy,
    String? info,
    String? error,
  }) {
    return LoginFormState(
      username: username ?? this.username,
      isRegistrationForm: isRegistrationForm ?? this.isRegistrationForm,
      isBusy: isBusy ?? this.isBusy,
      info: info ?? this.info,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'isRegistrationForm': isRegistrationForm,
      'isBusy': isBusy,
      'info': info,
      'error': error,
    };
  }

  factory LoginFormState.fromMap(Map<String, dynamic> map) {
    return LoginFormState(
      username: map['username'] as String,
      isRegistrationForm: map['isRegistrationForm'] as bool,
      isBusy: map['isBusy'] as bool,
      info: map['info'] as String,
      error: map['error'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginFormState.fromJson(String source) =>
      LoginFormState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginFormState(username: $username, isRegistrationForm: $isRegistrationForm, isBusy: $isBusy, info: $info, error: $error)';
  }

  @override
  bool operator ==(covariant LoginFormState other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.isRegistrationForm == isRegistrationForm &&
        other.isBusy == isBusy &&
        other.info == info &&
        other.error == error;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        isRegistrationForm.hashCode ^
        isBusy.hashCode ^
        info.hashCode ^
        error.hashCode;
  }
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

  void toggleIsBusy() {
    state = state.copyWith(isBusy: !state.isBusy);
  }

  void clearInfo() {
    state = state.copyWith(info: '');
  }

  void clearError() {
    state = state.copyWith(error: '');
  }

  Future<bool> authenticate(String password) async {
    if (state.username.isEmpty) {
      state = state.copyWith(error: "L'identifiant est requis");
      return false;
    }
    if (password.isEmpty) {
      state = state.copyWith(error: 'Le mot de passe est requis');
      return false;
    }
    try {
      await _pocketBase
          .collection('users')
          .authWithPassword(state.username, password);
      state = state.copyWith(error: '');
      return true;
    } on ClientException catch (e) {
      state = state.copyWith(error: e.response['message'] as String);
      return false;
    }
  }

  Future<bool> register(String password, String passwordConfirmation) async {
    if (state.username.isEmpty) {
      state = state.copyWith(error: "L'identifiant est requis");
      return false;
    }
    if (password.isEmpty || passwordConfirmation.isEmpty) {
      state = state.copyWith(error: 'Le mot de passe est requis');
      return false;
    }
    if (password != passwordConfirmation) {
      state = state.copyWith(error: 'Les mots de passe ne correspondent pas');
      return false;
    }
    try {
      await _pocketBase.collection('users').create(
        body: {
          'username': state.username,
          'password': password,
          'passwordConfirm': passwordConfirmation
        },
      );
      state = state.copyWith(info: 'Inscription réussie');
      return true;
    } on ClientException catch (e) {
      state = state.copyWith(error: e.response['message'] as String);
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
