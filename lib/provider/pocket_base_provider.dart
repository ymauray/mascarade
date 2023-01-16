import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketbase/pocketbase.dart';

final pockerBaseProvider = Provider(
  (ref) => PocketBase('https://mascarade.yannickmauray.ch/'),
);
