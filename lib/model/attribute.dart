// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/widgets.dart';

@immutable
class Attribute {
  final String? name;
  final int value;
  const Attribute({
    this.name,
    required this.value,
  });

  Attribute copyWith({
    String? name,
    int? value,
  }) {
    return Attribute(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'value': value,
    };
  }

  factory Attribute.fromMap(Map<String, dynamic> map) {
    return Attribute(
      name: map['name'] != null ? map['name'] as String : null,
      value: map['value'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Attribute.fromJson(String source) =>
      Attribute.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Attribute(name: $name, value: $value)';

  @override
  bool operator ==(covariant Attribute other) {
    if (identical(this, other)) return true;

    return other.name == name && other.value == value;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode;
}
