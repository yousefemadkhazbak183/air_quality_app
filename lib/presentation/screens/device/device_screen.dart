import 'package:air_high_quality_app/presentation/bloc/sensor_data_cubit.dart';
import 'package:air_high_quality_app/presentation/bloc/sensor_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../widgets/device_header.dart';
import '../../widgets/esp8266_card.dart';
import '../../widgets/section_label.dart';
import '../../widgets/sensor_tile.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DeviceHeader(),
              const SizedBox(height: 20),
              BlocBuilder<SensorDataCubit, SensorDataState>(
                builder: (context, state) {
                  final isConnected = state is SensorDataUpdated
                      ? state.isEsp8266Connected
                      : false;
                  final lastUpdate = state is SensorDataUpdated
                      ? state.reading.timestamp
                      : null;
                  return Esp8266Card(
                    isConnected: isConnected,
                    lastUpdate: lastUpdate,
                  );
                },
              ),
              const SizedBox(height: 16),
              const SectionLabel('Connected Sensors'),
              const SizedBox(height: 8),
              const SensorTile(
                icon: Icons.local_fire_department_outlined,
                iconColor: AppColors.good,
                title: 'MQ-2 Gas Sensor',
                subtitle: 'Detects combustible gases and smoke',
              ),
              const SizedBox(height: 8),
              const SensorTile(
                icon: Icons.thermostat_outlined,
                iconColor: Colors.lightBlue,
                title: 'DHT11 Sensor',
                subtitle: 'Temperature & humidity monitoring',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
