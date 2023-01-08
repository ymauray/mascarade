// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/widgets.dart';

@immutable
class Fiche {
  final String? playerid;
  final String? joueur;
  final String? nom;
  final String? chronique;
  final String? nature;
  final String? attitude;
  final String? concept;
  final String? clan;
  final String? generation;
  final String? refuge;

  final int? force;
  final int? dexterite;
  final int? vigeur;

  final int? charisme;
  final int? manipulation;
  final int? apparence;

  final int? perception;
  final int? intelligence;
  final int? astuce;

  final int? vigilance;
  final int? athletisme;
  final int? bagarre;
  final int? esquive;
  final int? empathie;
  final int? expression;
  final int? intimidation;
  final int? commandement;
  final int? connaissanceDeLaRue;
  final int? subterfuge;

  final int? animaux;
  final int? artisanat;
  final int? conduite;
  final int? etiquette;
  final int? armesAFeu;
  final int? melee;
  final int? representation;
  final int? securite;
  final int? furtivite;
  final int? survie;

  final int? erudition;
  final int? informatique;
  final int? finances;
  final int? investigation;
  final int? droit;
  final int? linguistique;
  final int? medecine;
  final int? occultisme;
  final int? politique;
  final int? science;

  const Fiche({
    this.playerid,
    this.joueur,
    this.nom,
    this.chronique,
    this.nature,
    this.attitude,
    this.concept,
    this.clan,
    this.generation,
    this.refuge,
    this.force,
    this.dexterite,
    this.vigeur,
    this.charisme,
    this.manipulation,
    this.apparence,
    this.perception,
    this.intelligence,
    this.astuce,
    this.vigilance,
    this.athletisme,
    this.bagarre,
    this.esquive,
    this.empathie,
    this.expression,
    this.intimidation,
    this.commandement,
    this.connaissanceDeLaRue,
    this.subterfuge,
    this.animaux,
    this.artisanat,
    this.conduite,
    this.etiquette,
    this.armesAFeu,
    this.melee,
    this.representation,
    this.securite,
    this.furtivite,
    this.survie,
    this.erudition,
    this.informatique,
    this.finances,
    this.investigation,
    this.droit,
    this.linguistique,
    this.medecine,
    this.occultisme,
    this.politique,
    this.science,
  });

  Fiche copyWith({
    String? playerid,
    String? joueur,
    String? nom,
    String? chronique,
    String? nature,
    String? attitude,
    String? concept,
    String? clan,
    String? generation,
    String? refuge,
    int? force,
    int? dexterite,
    int? vigeur,
    int? charisme,
    int? manipulation,
    int? apparence,
    int? perception,
    int? intelligence,
    int? astuce,
    int? vigilance,
    int? athletisme,
    int? bagarre,
    int? esquive,
    int? empathie,
    int? expression,
    int? intimidation,
    int? commandement,
    int? connaissanceDeLaRue,
    int? subterfuge,
    int? animaux,
    int? artisanat,
    int? conduite,
    int? etiquette,
    int? armesAFeu,
    int? melee,
    int? representation,
    int? securite,
    int? furtivite,
    int? survie,
    int? erudition,
    int? informatique,
    int? finances,
    int? investigation,
    int? droit,
    int? linguistique,
    int? medecine,
    int? occultisme,
    int? politique,
    int? science,
  }) {
    return Fiche(
      playerid: playerid ?? this.playerid,
      joueur: joueur ?? this.joueur,
      nom: nom ?? this.nom,
      chronique: chronique ?? this.chronique,
      nature: nature ?? this.nature,
      attitude: attitude ?? this.attitude,
      concept: concept ?? this.concept,
      clan: clan ?? this.clan,
      generation: generation ?? this.generation,
      refuge: refuge ?? this.refuge,
      force: force ?? this.force,
      dexterite: dexterite ?? this.dexterite,
      vigeur: vigeur ?? this.vigeur,
      charisme: charisme ?? this.charisme,
      manipulation: manipulation ?? this.manipulation,
      apparence: apparence ?? this.apparence,
      perception: perception ?? this.perception,
      intelligence: intelligence ?? this.intelligence,
      astuce: astuce ?? this.astuce,
      vigilance: vigilance ?? this.vigilance,
      athletisme: athletisme ?? this.athletisme,
      bagarre: bagarre ?? this.bagarre,
      esquive: esquive ?? this.esquive,
      empathie: empathie ?? this.empathie,
      expression: expression ?? this.expression,
      intimidation: intimidation ?? this.intimidation,
      commandement: commandement ?? this.commandement,
      connaissanceDeLaRue: connaissanceDeLaRue ?? this.connaissanceDeLaRue,
      subterfuge: subterfuge ?? this.subterfuge,
      animaux: animaux ?? this.animaux,
      artisanat: artisanat ?? this.artisanat,
      conduite: conduite ?? this.conduite,
      etiquette: etiquette ?? this.etiquette,
      armesAFeu: armesAFeu ?? this.armesAFeu,
      melee: melee ?? this.melee,
      representation: representation ?? this.representation,
      securite: securite ?? this.securite,
      furtivite: furtivite ?? this.furtivite,
      survie: survie ?? this.survie,
      erudition: erudition ?? this.erudition,
      informatique: informatique ?? this.informatique,
      finances: finances ?? this.finances,
      investigation: investigation ?? this.investigation,
      droit: droit ?? this.droit,
      linguistique: linguistique ?? this.linguistique,
      medecine: medecine ?? this.medecine,
      occultisme: occultisme ?? this.occultisme,
      politique: politique ?? this.politique,
      science: science ?? this.science,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'playerid': playerid,
      'joueur': joueur,
      'nom': nom,
      'chronique': chronique,
      'nature': nature,
      'attitude': attitude,
      'concept': concept,
      'clan': clan,
      'generation': generation,
      'refuge': refuge,
      'force': force,
      'dexterite': dexterite,
      'vigeur': vigeur,
      'charisme': charisme,
      'manipulation': manipulation,
      'apparence': apparence,
      'perception': perception,
      'intelligence': intelligence,
      'astuce': astuce,
      'vigilance': vigilance,
      'athletisme': athletisme,
      'bagarre': bagarre,
      'esquive': esquive,
      'empathie': empathie,
      'expression': expression,
      'intimidation': intimidation,
      'commandement': commandement,
      'connaissanceDeLaRue': connaissanceDeLaRue,
      'subterfuge': subterfuge,
      'animaux': animaux,
      'artisanat': artisanat,
      'conduite': conduite,
      'etiquette': etiquette,
      'armesAFeu': armesAFeu,
      'melee': melee,
      'representation': representation,
      'securite': securite,
      'furtivite': furtivite,
      'survie': survie,
      'erudition': erudition,
      'informatique': informatique,
      'finances': finances,
      'investigation': investigation,
      'droit': droit,
      'linguistique': linguistique,
      'medecine': medecine,
      'occultisme': occultisme,
      'politique': politique,
      'science': science,
    };
  }

  factory Fiche.fromMap(Map<String, dynamic> map) {
    return Fiche(
      playerid: map['playerid'] != null ? map['playerid'] as String : null,
      joueur: map['joueur'] != null ? map['joueur'] as String : null,
      nom: map['nom'] != null ? map['nom'] as String : null,
      chronique: map['chronique'] != null ? map['chronique'] as String : null,
      nature: map['nature'] != null ? map['nature'] as String : null,
      attitude: map['attitude'] != null ? map['attitude'] as String : null,
      concept: map['concept'] != null ? map['concept'] as String : null,
      clan: map['clan'] != null ? map['clan'] as String : null,
      generation:
          map['generation'] != null ? map['generation'] as String : null,
      refuge: map['refuge'] != null ? map['refuge'] as String : null,
      force: map['force'] != null ? map['force'] as int : null,
      dexterite: map['dexterite'] != null ? map['dexterite'] as int : null,
      vigeur: map['vigeur'] != null ? map['vigeur'] as int : null,
      charisme: map['charisme'] != null ? map['charisme'] as int : null,
      manipulation:
          map['manipulation'] != null ? map['manipulation'] as int : null,
      apparence: map['apparence'] != null ? map['apparence'] as int : null,
      perception: map['perception'] != null ? map['perception'] as int : null,
      intelligence:
          map['intelligence'] != null ? map['intelligence'] as int : null,
      astuce: map['astuce'] != null ? map['astuce'] as int : null,
      vigilance: map['vigilance'] != null ? map['vigilance'] as int : null,
      athletisme: map['athletisme'] != null ? map['athletisme'] as int : null,
      bagarre: map['bagarre'] != null ? map['bagarre'] as int : null,
      esquive: map['esquive'] != null ? map['esquive'] as int : null,
      empathie: map['empathie'] != null ? map['empathie'] as int : null,
      expression: map['expression'] != null ? map['expression'] as int : null,
      intimidation:
          map['intimidation'] != null ? map['intimidation'] as int : null,
      commandement:
          map['commandement'] != null ? map['commandement'] as int : null,
      connaissanceDeLaRue: map['connaissanceDeLaRue'] != null
          ? map['connaissanceDeLaRue'] as int
          : null,
      subterfuge: map['subterfuge'] != null ? map['subterfuge'] as int : null,
      animaux: map['animaux'] != null ? map['animaux'] as int : null,
      artisanat: map['artisanat'] != null ? map['artisanat'] as int : null,
      conduite: map['conduite'] != null ? map['conduite'] as int : null,
      etiquette: map['etiquette'] != null ? map['etiquette'] as int : null,
      armesAFeu: map['armesAFeu'] != null ? map['armesAFeu'] as int : null,
      melee: map['melee'] != null ? map['melee'] as int : null,
      representation:
          map['representation'] != null ? map['representation'] as int : null,
      securite: map['securite'] != null ? map['securite'] as int : null,
      furtivite: map['furtivite'] != null ? map['furtivite'] as int : null,
      survie: map['survie'] != null ? map['survie'] as int : null,
      erudition: map['erudition'] != null ? map['erudition'] as int : null,
      informatique:
          map['informatique'] != null ? map['informatique'] as int : null,
      finances: map['finances'] != null ? map['finances'] as int : null,
      investigation:
          map['investigation'] != null ? map['investigation'] as int : null,
      droit: map['droit'] != null ? map['droit'] as int : null,
      linguistique:
          map['linguistique'] != null ? map['linguistique'] as int : null,
      medecine: map['medecine'] != null ? map['medecine'] as int : null,
      occultisme: map['occultisme'] != null ? map['occultisme'] as int : null,
      politique: map['politique'] != null ? map['politique'] as int : null,
      science: map['science'] != null ? map['science'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Fiche.fromJson(String source) =>
      Fiche.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Fiche(playerid: $playerid, joueur: $joueur, nom: $nom, '
        'chronique: $chronique, nature: $nature, attitude: $attitude, '
        'concept: $concept, clan: $clan, generation: $generation, '
        'refuge: $refuge, force: $force, dexterite: $dexterite, '
        'vigeur: $vigeur, charisme: $charisme, manipulation: $manipulation, '
        'apparence: $apparence, perception: $perception, '
        'intelligence: $intelligence, astuce: $astuce, vigilance: $vigilance, '
        'athletisme: $athletisme, bagarre: $bagarre, esquive: $esquive, '
        'empathie: $empathie, expression: $expression, '
        'intimidation: $intimidation, commandement: $commandement, '
        'connaissanceDeLaRue: $connaissanceDeLaRue, subterfuge: $subterfuge, '
        'animaux: $animaux, artisanat: $artisanat, conduite: $conduite, '
        'etiquette: $etiquette, armesAFeu: $armesAFeu, melee: $melee, '
        'representation: $representation, securite: $securite, '
        'furtivite: $furtivite, survie: $survie, erudition: $erudition, '
        'informatique: $informatique, finances: $finances, '
        'investigation: $investigation, droit: $droit, '
        'linguistique: $linguistique, medecine: $medecine, '
        'occultisme: $occultisme, politique: $politique, science: $science)';
  }

  @override
  bool operator ==(covariant Fiche other) {
    if (identical(this, other)) return true;

    return other.playerid == playerid &&
        other.joueur == joueur &&
        other.nom == nom &&
        other.chronique == chronique &&
        other.nature == nature &&
        other.attitude == attitude &&
        other.concept == concept &&
        other.clan == clan &&
        other.generation == generation &&
        other.refuge == refuge &&
        other.force == force &&
        other.dexterite == dexterite &&
        other.vigeur == vigeur &&
        other.charisme == charisme &&
        other.manipulation == manipulation &&
        other.apparence == apparence &&
        other.perception == perception &&
        other.intelligence == intelligence &&
        other.astuce == astuce &&
        other.vigilance == vigilance &&
        other.athletisme == athletisme &&
        other.bagarre == bagarre &&
        other.esquive == esquive &&
        other.empathie == empathie &&
        other.expression == expression &&
        other.intimidation == intimidation &&
        other.commandement == commandement &&
        other.connaissanceDeLaRue == connaissanceDeLaRue &&
        other.subterfuge == subterfuge &&
        other.animaux == animaux &&
        other.artisanat == artisanat &&
        other.conduite == conduite &&
        other.etiquette == etiquette &&
        other.armesAFeu == armesAFeu &&
        other.melee == melee &&
        other.representation == representation &&
        other.securite == securite &&
        other.furtivite == furtivite &&
        other.survie == survie &&
        other.erudition == erudition &&
        other.informatique == informatique &&
        other.finances == finances &&
        other.investigation == investigation &&
        other.droit == droit &&
        other.linguistique == linguistique &&
        other.medecine == medecine &&
        other.occultisme == occultisme &&
        other.politique == politique &&
        other.science == science;
  }

  @override
  int get hashCode {
    return playerid.hashCode ^
        joueur.hashCode ^
        nom.hashCode ^
        chronique.hashCode ^
        nature.hashCode ^
        attitude.hashCode ^
        concept.hashCode ^
        clan.hashCode ^
        generation.hashCode ^
        refuge.hashCode ^
        force.hashCode ^
        dexterite.hashCode ^
        vigeur.hashCode ^
        charisme.hashCode ^
        manipulation.hashCode ^
        apparence.hashCode ^
        perception.hashCode ^
        intelligence.hashCode ^
        astuce.hashCode ^
        vigilance.hashCode ^
        athletisme.hashCode ^
        bagarre.hashCode ^
        esquive.hashCode ^
        empathie.hashCode ^
        expression.hashCode ^
        intimidation.hashCode ^
        commandement.hashCode ^
        connaissanceDeLaRue.hashCode ^
        subterfuge.hashCode ^
        animaux.hashCode ^
        artisanat.hashCode ^
        conduite.hashCode ^
        etiquette.hashCode ^
        armesAFeu.hashCode ^
        melee.hashCode ^
        representation.hashCode ^
        securite.hashCode ^
        furtivite.hashCode ^
        survie.hashCode ^
        erudition.hashCode ^
        informatique.hashCode ^
        finances.hashCode ^
        investigation.hashCode ^
        droit.hashCode ^
        linguistique.hashCode ^
        medecine.hashCode ^
        occultisme.hashCode ^
        politique.hashCode ^
        science.hashCode;
  }
}
