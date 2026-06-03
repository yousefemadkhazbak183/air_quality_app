import 'package:air_high_quality_app/presentation/bloc/sensor_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFF5F7FA),
    ),
  );

  await setupInjection();
  runApp(const AirQualityApp());
}

class AirQualityApp extends StatelessWidget {
  const AirQualityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SensorDataCubit>(
      create: (_) => sl<SensorDataCubit>(),
      child: MaterialApp.router(
        title: 'AirGuard',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.light,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
