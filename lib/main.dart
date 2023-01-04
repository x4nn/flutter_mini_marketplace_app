import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mini_marketplace_app/app.dart';
import 'package:mini_marketplace_app/simple_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Directory? dir = await getExternalStorageDirectory().onError((error, stackTrace) async {
    return getApplicationDocumentsDirectory();
  });

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : dir!,
  );

  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}
