import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/model/fiche.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:pocketbase/pocketbase.dart';

class FicheStateNotifier extends StateNotifier<Fiche> {
  FicheStateNotifier(this.pocketBase) : super(Fiche());

  final PocketBase pocketBase;

  Future<void> load() async {
    RecordModel fiche;
    final user = pocketBase.authStore.model as RecordModel;
    final fiches = await pocketBase.collection('fiches').getList(
      query: {
        'playerid': user.id,
      },
    );
    if (fiches.items.isEmpty) {
      fiche = await pocketBase.collection('fiches').create(
            body: Fiche(playerid: user.id).toMap(),
          );
    } else {
      fiche = fiches.items.first;
    }
    state = Fiche.fromJson(fiche.toString());
  }
}

final ficheProvider = StateNotifierProvider<FicheStateNotifier, Fiche>((ref) {
  final pocketBase = ref.read(pocketBaseProvider);
  return FicheStateNotifier(pocketBase);
});
