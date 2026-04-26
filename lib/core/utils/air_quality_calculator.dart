import '../constants/app_constants.dart';
import '../enums/air_quality_status.dart';

abstract final class AirQualityCalculator {
  static AirQualityStatus fromGasPpm(double ppm) {
    if (ppm < AppConstants.goodThresholdPpm) return AirQualityStatus.good;
    if (ppm < AppConstants.moderateThresholdPpm) {
      return AirQualityStatus.moderate;
    }
    return AirQualityStatus.dangerous;
  }

  static double toProgressValue(double ppm) {
    const double max = 1000.0;
    return (ppm / max).clamp(0.0, 1.0);
  }
}
