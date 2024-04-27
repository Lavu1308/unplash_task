import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:uplash_task/store/list_store.dart';

final getIt = GetIt.instance;

FutureOr<void> registerDependencies() {
  getIt.registerSingleton<ListStore>(
    ListStore(),
    signalsReady: true,
  );
}
