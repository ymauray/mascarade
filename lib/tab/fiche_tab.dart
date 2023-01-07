import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/widget/advantages_section.dart';
import 'package:mascarade/widget/attributes_section.dart';
import 'package:mascarade/widget/capacities_section.dart';
import 'package:mascarade/widget/horizontal_separator.dart';
import 'package:mascarade/widget/identity.dart';

class FicheTab extends ConsumerWidget {
  const FicheTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: .4,
              child: Image.asset(
                'assets/images/vampire_the_masquarade.png',
                filterQuality: FilterQuality.medium,
              ),
            ),
            const Identity(),
            const HorizontalSeparator(label: 'Attributs (7/5/3)'),
            const AttributesSection(),
            const HorizontalSeparator(label: 'Capacités (13/9/5)'),
            const CapacitiesSection(),
            const HorizontalSeparator(label: 'Avantages'),
            const AdvantagesSection(),
            const HorizontalSeparator(),
          ],
        ),
      ),
    );
  }
}
