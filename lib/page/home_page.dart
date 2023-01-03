import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/provider/fiche_provider.dart';
import 'package:mascarade/widget/advantages_section.dart';
import 'package:mascarade/widget/attributes_section.dart';
import 'package:mascarade/widget/capacities_section.dart';
import 'package:mascarade/widget/horizontal_separator.dart';
import 'package:mascarade/widget/identity.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fiche = ref.watch(ficheProvider);

    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                HorizontalSeparator(label: 'Vampires, la mascarade'),
                Identity(),
                HorizontalSeparator(label: 'Attributs (7/5/3)'),
                AttributesSection(),
                HorizontalSeparator(label: 'Capacités (13/9/5)'),
                CapacitiesSection(),
                HorizontalSeparator(label: 'Avantages'),
                AdvantagesSection(),
                HorizontalSeparator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
