import 'dart:async';

import 'package:flutter/material.dart';

import '/app/core/values/app_values.dart';

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({
    this.milliseconds = AppValues.defaultDebounceTimeInMilliSeconds,
  });

  Future<void> run(VoidCallback action) async {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(
      Duration(milliseconds: milliseconds),
      action,
    );
  }
}
