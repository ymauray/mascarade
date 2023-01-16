import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/model/login_form_model.dart';

class LoginFormNotifier extends StateNotifier<LoginFormModel> {
  LoginFormNotifier()
      : super(
          LoginFormModel(
            isRegistrationForm: false,
            registerStoryteller: false,
          ),
        );

  bool get registrationForm => state.isRegistrationForm;
  set registrationForm(bool value) {
    state = state.copyWith(isRegistrationForm: value);
  }

  bool get registerStoryteller => state.registerStoryteller;
  set registerStoryteller(bool value) {
    state = state.copyWith(registerStoryteller: value);
  }

  //void toggleRegistrationForm() {
  //  state = state.copyWith(isRegistrationForm: !state.isRegistrationForm);
  //}

  //void toggleRegisterStoryteller() {
  //  state = state.copyWith(registerStoryteller: !state.registerStoryteller);
  //}
}

final loginFormProvider =
    StateNotifierProvider<LoginFormNotifier, LoginFormModel>(
  (ref) => LoginFormNotifier(),
);
