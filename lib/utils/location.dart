import 'dart:math';

class LocationUtils {
  /// Calcula la distancia entre dos puntos geográficos usando la fórmula de Haversine
  ///
  /// [lat1]: Latitud del primer punto
  /// [lon1]: Longitud del primer punto
  /// [lat2]: Latitud del segundo punto
  /// [lon2]: Longitud del segundo punto
  ///
  /// Devuelve la distancia en metros
  static double calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    // Radio de la Tierra en metros
    const double earthRadius = 6371e3;

    // Convertir grados a radianes
    double degreesToRadians(double degrees) => degrees * pi / 180;

    // Convertir latitudes a radianes
    final double phi1 = degreesToRadians(lat1);
    final double phi2 = degreesToRadians(lat2);

    // Diferencias en radianes
    final double deltaPhi = degreesToRadians(lat2 - lat1);
    final double deltaLambda = degreesToRadians(lon2 - lon1);

    // Cálculo de Haversine
    final double a = sin(deltaPhi / 2) * sin(deltaPhi / 2) +
        cos(phi1) * cos(phi2) * sin(deltaLambda / 2) * sin(deltaLambda / 2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    // Distancia final
    return earthRadius * c;
  }

  /// Verifica si dos puntos están dentro de un radio específico
  static bool isWithinRadius(
      double lat1, double lon1, double lat2, double lon2, double radiusMeters) {
    final double distance = calculateDistance(lat1, lon1, lat2, lon2);
    return distance <= radiusMeters;
  }
}
