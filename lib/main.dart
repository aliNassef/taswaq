import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'core/cache/cache_helper.dart';
import 'core/di/dependency_injuction.dart';
import 'taswaq.dart';

import 'core/shared/widgets/custom_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper().init();
  Bloc.observer = CustomBlocObserver();
  await setupGetIt();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const Taswaq(),
    ),
  );
}
