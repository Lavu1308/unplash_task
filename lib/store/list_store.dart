import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../api/api_class.dart';

class ListStore {
  final _api = UnSplashApi();

  Observable<ObservableFuture<Map<String, dynamic>?>?> data = Observable(null);

  @action
  Future<void> fetchAllPhotos() async {
    try {
      // annotation for ui update from observable variable
      runInAction(() {
        data.value = ObservableFuture(_api.fetchAllPhotos());
      });
    } catch (e) {
      debugPrint('store error $e');
      runInAction(() => data.value = null);
    }
  }
}
