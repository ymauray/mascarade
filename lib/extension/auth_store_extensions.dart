import 'package:pocketbase/pocketbase.dart';

extension IsStoryTeller on AuthStore {
  bool get isStoryTeller => (model as RecordModel).data['storyteller'] as bool;
}
