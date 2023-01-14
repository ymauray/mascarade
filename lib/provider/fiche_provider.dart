import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/extension/auth_store_extensions.dart';
import 'package:mascarade/model/avantage.dart';
import 'package:mascarade/model/fiche.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:pocketbase/pocketbase.dart';

class FicheStateNotifier extends StateNotifier<Fiche> {
  FicheStateNotifier(this.pocketBase) : super(const Fiche(avantages: []));

  final PocketBase pocketBase;

  Future<void> load() async {
    if (pocketBase.authStore.isStoryTeller) return;

    RecordModel fiche;
    final user = pocketBase.authStore.model as RecordModel;
    final fiches = await pocketBase.collection('fiches').getList(
      query: {
        'idJoueur': user.id,
      },
    );
    if (fiches.items.isEmpty) {
      fiche = await pocketBase.collection('fiches').create(
            body: Fiche(idJoueur: user.id, avantages: const []).toMap(),
          );
    } else {
      fiche = fiches.items.first;
    }
    state = Fiche.fromJson(fiche.toString());
    final avantages = await pocketBase.collection('avantages').getList(
      query: {
        'fiche': fiche.id,
      },
    );
    state = state.copyWith(
      avantages:
          avantages.items.map((e) => Avantage.fromJson(e.toString())).toList(),
    );
  }
}

final ficheProvider = StateNotifierProvider<FicheStateNotifier, Fiche>((ref) {
  final pocketBase = ref.read(pocketBaseProvider);
  return FicheStateNotifier(pocketBase);
});
