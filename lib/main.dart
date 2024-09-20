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
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper().init();
  Bloc.observer = CustomBlocObserver();
  await setupGetIt();
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://e82bc4ce56785673fcb7f155c27b21b9@o4507987094929408.ingest.us.sentry.io/4507987097288704';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = .01;
      },
      appRunner: () => runApp(
        const Taswaq(),
      ),
    );
  } else {
    runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const Taswaq(),
      ),
    );
  }
}
