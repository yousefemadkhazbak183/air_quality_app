import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'status_badge.dart';

class Esp8266Card extends StatelessWidget {
  const Esp8266Card({
    super.key,
    required this.isConnected,
    required this.lastUpdate,
  });

  final bool isConnected;
  final DateTime? lastUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.good.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.memory_rounded,
                  color: AppColors.good,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ESP8266',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Main Controller',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              StatusBadge(isConnected: isConnected),
            ],
          ),
          if (lastUpdate != null) ...[
            const SizedBox(height: 12),
            const Divider(color: AppColors.divider),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Last Data Update',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '${lastUpdate!.hour.toString().padLeft(2, '0')}:'
                  '${lastUpdate!.minute.toString().padLeft(2, '0')}:'
                  '${lastUpdate!.second.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
