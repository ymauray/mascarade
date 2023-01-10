// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:b/b.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:pocketbase/pocketbase.dart';

@immutable
class LoginFormState {
  const LoginFormState({
    this.isRegistrationForm = false,
    this.isBusy = false,
    this.info = '',
    this.error = '',
    this.registerAsStoryteller = false,
  });

  final bool isRegistrationForm;
  final bool isBusy;
  final String info;
  final String error;
  final bool registerAsStoryteller;

  LoginFormState copyWith({
    bool? isRegistrationForm,
    bool? isBusy,
    String? info,
    String? error,
    bool? registerAsStoryteller,
  }) {
    return LoginFormState(
      isRegistrationForm: isRegistrationForm ?? this.isRegistrationForm,
      isBusy: isBusy ?? this.isBusy,
      info: info ?? this.info,
      error: error ?? this.error,
      registerAsStoryteller:
          registerAsStoryteller ?? this.registerAsStoryteller,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isRegistrationForm': isRegistrationForm,
      'isBusy': isBusy,
      'info': info,
      'error': error,
      'registerAsStoryteller': registerAsStoryteller,
    };
  }

  factory LoginFormState.fromMap(Map<String, dynamic> map) {
    return LoginFormState(
      isRegistrationForm: map['isRegistrationForm'] as bool,
      isBusy: map['isBusy'] as bool,
      info: map['info'] as String,
      error: map['error'] as String,
      registerAsStoryteller: map['registerAsStoryteller'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginFormState.fromJson(String source) =>
      LoginFormState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginFormState(isRegistrationForm: $isRegistrationForm, '
        'isBusy: $isBusy, info: $info, error: $error, '
        'registerAsStoryteller: $registerAsStoryteller)';
  }

  @override
  bool operator ==(covariant LoginFormState other) {
    if (identical(this, other)) return true;

    return other.isRegistrationForm == isRegistrationForm &&
        other.isBusy == isBusy &&
        other.info == info &&
        other.error == error &&
        other.registerAsStoryteller == registerAsStoryteller;
  }

  @override
  int get hashCode {
    return isRegistrationForm.hashCode ^
        isBusy.hashCode ^
        info.hashCode ^
        error.hashCode ^
        registerAsStoryteller.hashCode;
  }
}

class LoginFormStateNotifier extends StateNotifier<LoginFormState> {
  LoginFormStateNotifier(this._pocketBase) : super(const LoginFormState());

  final PocketBase _pocketBase;

  void toggleIsRegistrationForm() {
    state = state.copyWith(isRegistrationForm: !state.isRegistrationForm);
  }

  void toggleIsBusy() {
    state = state.copyWith(isBusy: !state.isBusy);
  }

  void toggleRegisterAsStoryteller() {
    state = state.copyWith(registerAsStoryteller: !state.registerAsStoryteller);
  }

  void clearInfo() {
    state = state.copyWith(info: '');
  }

  void clearError() {
    state = state.copyWith(error: '');
  }

  Future<bool> authenticate(String username, String password) async {
    if (username.isEmpty) {
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
          .authWithPassword(username, password);
      state = state.copyWith(error: '');
      return true;
    } on ClientException catch (e) {
      state = state.copyWith(error: e.response['message'] as String);
      return false;
    }
  }

  Future<bool> register(
    String username,
    String password,
    String passwordConfirmation,
  ) async {
    if (username.isEmpty) {
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
      final recordModel = await _pocketBase.collection('users').create(
        body: {
          'username': username,
          'password': password,
          'passwordConfirm': passwordConfirmation,
          'storyteller': state.registerAsStoryteller,
        },
      );
      if (state.registerAsStoryteller) {
        final converter = BaseConversion(from: base10, to: base58);
        final stamp = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
        final reversedStamp =
            converter(stamp.toString()).split('').reversed.join();
        final codeBuffer = StringBuffer();
        for (var i = 0; i < reversedStamp.length; i += 2) {
          codeBuffer.write(reversedStamp[i]);
        }
        for (var i = 1; i < reversedStamp.length; i += 2) {
          codeBuffer.write(reversedStamp[i]);
        }
        final code = codeBuffer.toString();
        await _pocketBase.collection('chronicles').create(
          body: {
            'code': code,
            'storyteller': recordModel.id,
          },
        );
      }
      state = state.copyWith(
        info: 'Inscription réussie',
        registerAsStoryteller: false,
      );
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
