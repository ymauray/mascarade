import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mascarade/provider/pocket_base_provider.dart';
import 'package:pocketbase/pocketbase.dart';

class ChronicleDAL {
  ChronicleDAL(this._pocketBase);

  final PocketBase _pocketBase;

  Future<void> create(String chronicleName) async {
    await _pocketBase.collection('chronicles').create(
      body: {
        'code': 'abcd',
        'title': chronicleName,
        'storyteller': (_pocketBase.authStore.model as RecordModel).id,
      },
    );
  }
}

final chronicleDalProvider = Provider<ChronicleDAL>(
  (ref) => ChronicleDAL(ref.watch(pocketBaseProvider)),
);
