import 'package:air_high_quality_app/presentation/bloc/sensor_data_cubit.dart';
import 'package:air_high_quality_app/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:air_high_quality_app/presentation/screens/device/device_screen.dart';
import 'package:air_high_quality_app/presentation/screens/graph/analytics_screen.dart';
import 'package:air_high_quality_app/presentation/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [
    DashboardScreen(),
    AnalyticsScreen(),
    DeviceScreen(),
    SettingsScreen(),
  ];
  @override
  void initState() {
    super.initState();
    context.read<SensorDataCubit>().startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: "Analytics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.device_hub),
            label: "Device",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
