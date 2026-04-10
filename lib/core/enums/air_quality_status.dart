enum AirQualityStatus {
  good,
  moderate,
  dangerous;

  String get label => switch (this) {
    AirQualityStatus.good => 'GOOD',
    AirQualityStatus.moderate => 'MODERATE',
    AirQualityStatus.dangerous => 'DANGEROUS',
  };

  String get description => switch (this) {
    AirQualityStatus.good => 'Air conditions are safe',
    AirQualityStatus.moderate => 'Air quality is acceptable',
    AirQualityStatus.dangerous => 'Dangerous air quality!',
  };
}
