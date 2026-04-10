import 'package:air_high_quality_app/core/constants/app_constants.dart';
import 'package:air_high_quality_app/core/enums/air_quality_status.dart';

abstract final class AirQualityCalculator {
  static AirQualityStatus fromGasPpm(double ppm) {
    if (ppm < AppConstants.goodThresholdPpm) return AirQualityStatus.good;
    if (ppm < AppConstants.moderateThresholdPpm) {
      return AirQualityStatus.moderate;
    }
    return AirQualityStatus.dangerous;
  }
}
