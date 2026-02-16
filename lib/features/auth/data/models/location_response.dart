import 'package:swiri/features/auth/data/models/location.dart';

class LocationResponse {
  final Location location;

  LocationResponse({required this.location});

  factory LocationResponse.fromJson(Map<String, dynamic> json) {
    return LocationResponse(
      location: Location.fromJson(
        json['location'] as Map<String, dynamic>? ?? {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'location': location.toJson()};
  }
}
