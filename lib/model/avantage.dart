// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class Avantage {
  final String id;
  final String fiche;
  final String joueur;
  final String type;
  final String libelle;
  final int points;
  final int ordre;
  const Avantage({
    required this.id,
    required this.fiche,
    required this.joueur,
    required this.type,
    required this.libelle,
    required this.points,
    required this.ordre,
  });

  Avantage copyWith({
    String? id,
    String? fiche,
    String? joueur,
    String? type,
    String? libelle,
    int? points,
    int? ordre,
  }) {
    return Avantage(
      id: id ?? this.id,
      fiche: fiche ?? this.fiche,
      joueur: joueur ?? this.joueur,
      type: type ?? this.type,
      libelle: libelle ?? this.libelle,
      points: points ?? this.points,
      ordre: ordre ?? this.ordre,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fiche': fiche,
      'joueur': joueur,
      'type': type,
      'libelle': libelle,
      'points': points,
      'ordre': ordre,
    };
  }

  factory Avantage.fromMap(Map<String, dynamic> map) {
    return Avantage(
      id: map['id'] as String,
      fiche: map['fiche'] as String,
      joueur: map['joueur'] as String,
      type: map['type'] as String,
      libelle: map['libelle'] as String,
      points: map['points'] as int,
      ordre: map['ordre'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Avantage.fromJson(String source) =>
      Avantage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Avantage(id: $id, fiche: $fiche, joueur: $joueur, type: $type, libelle: $libelle, points: $points, ordre: $ordre)';
  }

  @override
  bool operator ==(covariant Avantage other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fiche == fiche &&
        other.joueur == joueur &&
        other.type == type &&
        other.libelle == libelle &&
        other.points == points &&
        other.ordre == ordre;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fiche.hashCode ^
        joueur.hashCode ^
        type.hashCode ^
        libelle.hashCode ^
        points.hashCode ^
        ordre.hashCode;
  }
}
