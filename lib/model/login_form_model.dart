import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginFormModel {
  final bool isRegistrationForm;
  final bool registerStoryteller;

  LoginFormModel({
    required this.isRegistrationForm,
    required this.registerStoryteller,
  });

  LoginFormModel copyWith({
    bool? isRegistrationForm,
    bool? registerStoryteller,
  }) {
    return LoginFormModel(
      isRegistrationForm: isRegistrationForm ?? this.isRegistrationForm,
      registerStoryteller: registerStoryteller ?? this.registerStoryteller,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isRegistrationForm': isRegistrationForm,
      'registerStoryteller': registerStoryteller,
    };
  }

  factory LoginFormModel.fromMap(Map<String, dynamic> map) {
    return LoginFormModel(
      isRegistrationForm: map['isRegistrationForm'] as bool,
      registerStoryteller: map['registerStoryteller'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginFormModel.fromJson(String source) =>
      LoginFormModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginFormModel(isRegistrationForm: $isRegistrationForm, registerStoryteller: $registerStoryteller)';

  @override
  bool operator ==(covariant LoginFormModel other) {
    if (identical(this, other)) return true;

    return other.isRegistrationForm == isRegistrationForm &&
        other.registerStoryteller == registerStoryteller;
  }

  @override
  int get hashCode =>
      isRegistrationForm.hashCode ^ registerStoryteller.hashCode;
}
