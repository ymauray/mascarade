import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';

final pocketBaseProvider = Provider((ref) {
  return PocketBase('https://pocketbase.yannickmauray.ch/');
});
