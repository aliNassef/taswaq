import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/features/layout/presentation/views/layout_view.dart';
 import 'core/utils/app_colors.dart';
import 'core/utils/app_router.dart';

class Taswaq extends StatelessWidget {
  const Taswaq({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      enableScaleWH: () => false,
      enableScaleText: () => false,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: LayoutView.routeName,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(),
          ),
          fontFamily: 'PlusJakartaSans',
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        ),
      ),
    );
  }
}
