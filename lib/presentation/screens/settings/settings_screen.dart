import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../widgets/navigation_tile.dart';
import '../../widgets/section_label.dart';
import '../../widgets/settings_card.dart';
import '../../widgets/settings_header.dart';
import '../../widgets/threshold_tile.dart';
import '../../widgets/toggle_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pushNotifications = true;
  bool _darkMode = true;
  bool _hapticFeedback = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingsHeader(),
              const SizedBox(height: 20),
              const SectionLabel('Preferences'),
              const SizedBox(height: 8),
              SettingsCard(
                children: [
                  ToggleTile(
                    icon: Icons.notifications_outlined,
                    title: 'Push Notifications',
                    subtitle: 'Get alerts for dangerous air quality',
                    value: _pushNotifications,
                    onChanged: (v) => setState(() => _pushNotifications = v),
                  ),
                  const Divider(color: AppColors.divider),
                  ToggleTile(
                    icon: Icons.dark_mode_outlined,
                    title: 'Dark Mode',
                    subtitle: 'Enable dark theme for eye comfort',
                    value: _darkMode,
                    onChanged: (v) => setState(() => _darkMode = v),
                  ),
                  const Divider(color: AppColors.divider),
                  ToggleTile(
                    icon: Icons.vibration_outlined,
                    title: 'Haptic Feedback',
                    subtitle: 'Vibration on interactions',
                    value: _hapticFeedback,
                    onChanged: (v) => setState(() => _hapticFeedback = v),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const SectionLabel('Alert Thresholds'),
              const SizedBox(height: 8),
              SettingsCard(
                children: [
                  ThresholdTile(
                    label: 'Gas Level Warning',
                    value: AppConstants.goodThresholdPpm,
                    color: AppColors.moderate,
                    unit: 'ppm',
                  ),
                  const SizedBox(height: 12),
                  ThresholdTile(
                    label: 'Gas Level Danger',
                    value: AppConstants.moderateThresholdPpm,
                    color: AppColors.dangerous,
                    unit: 'ppm',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const SectionLabel('Support'),
              const SizedBox(height: 8),
              SettingsCard(
                children: [
                  NavigationTile(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    subtitle: 'How we handle your data',
                  ),
                  const Divider(color: AppColors.divider),
                  NavigationTile(
                    icon: Icons.help_outline_rounded,
                    title: 'Help & Support',
                    subtitle: 'Get help with the app',
                  ),
                  const Divider(color: AppColors.divider),
                  NavigationTile(
                    icon: Icons.info_outline_rounded,
                    title: 'About AirGuard',
                    subtitle: 'Version 1.0.0',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
