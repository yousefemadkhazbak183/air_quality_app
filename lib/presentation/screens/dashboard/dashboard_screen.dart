import 'package:air_high_quality_app/presentation/bloc/sensor_data_cubit.dart';
import 'package:air_high_quality_app/presentation/bloc/sensor_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../widgets/dashboard_body.dart';
import '../../widgets/error_view.dart';
import '../../widgets/loading_view.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<SensorDataCubit, SensorDataState>(
          builder: (context, state) => switch (state) {
            SensorDataInitial() || SensorDataLoading() => const LoadingView(),
            SensorDataUpdated(reading: final reading) => DashboardBody(
              reading: reading,
            ),
            SensorDataError(message: final message) => ErrorView(
              message: message,
            ),
          },
        ),
      ),
    );
  }
}
