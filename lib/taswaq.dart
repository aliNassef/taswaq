import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/splash/presentation/view/splash_view.dart';
import 'core/shared/widgets/custom_no_internet_widget.dart';
import 'features/layout/presentation/manger/check_connectivity_bloc/connectivity_state.dart';
import 'features/layout/presentation/manger/check_connectivity_bloc/connectivity_bloc.dart';
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
      builder: (context, child) => BlocProvider(
        create: (context) => ConnectivityBloc(),
        child: Builder(
          builder: (context) {
            return BlocBuilder<ConnectivityBloc, ConnectivityState>(
              buildWhen: (previous, current) =>
                  current is ConnectivityFailure ||
                  current is ConnectivitySuccess ||
                  current is ConnectivityInitial,
              builder: (context, state) {
                if (state is ConnectivityFailure) {
                  return const CustomNoInternetWidget();
                }
                return MaterialApp(
                  locale: DevicePreview.locale(context),
                  builder: DevicePreview.appBuilder,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: onGenerateRoute,
                  initialRoute: state is ConnectivityFailure
                      ? CustomNoInternetWidget.routeName
                      : SplashView.routeName,
                  theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                      systemOverlayStyle: SystemUiOverlayStyle(),
                    ),
                    fontFamily: 'PlusJakartaSans',
                    scaffoldBackgroundColor: Colors.white,
                    colorScheme:
                        ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
