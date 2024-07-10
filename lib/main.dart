import 'dart:async';
import 'package:flutter/material.dart';
import 'package:guide_app/all_feat.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

FutureOr<void> main() {
  runApp(ProviderScope(child: AppWidget()));
}
