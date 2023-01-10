import 'package:pocketbase/pocketbase.dart';

extension AuthStoreExtension on AuthStore {
  bool get isStoryTeller => (model as RecordModel).data['storyteller'] as bool;
  String getString(String key) => (model as RecordModel).data.keys.contains(key)
      ? (model as RecordModel).data[key] as String
      : '';
}
