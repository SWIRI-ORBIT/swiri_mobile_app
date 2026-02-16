import 'package:swiri/features/auth/data/models/coordinates.dart';

class Location {
  final String id;
  final Coordinates coordinates;
  final String childId;
  final int accuracy;
  final String recordedAt;
  final String createdAt;
  final String updatedAt;

  Location({
    required this.id,
    required this.coordinates,
    required this.childId,
    required this.accuracy,
    required this.recordedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['_id'] ?? '',
      coordinates: Coordinates.fromJson(
        json['coordinates'] as Map<String, dynamic>? ?? {},
      ),
      childId: json['child'] ?? '',
      accuracy: json['accuracy'] ?? 0,
      recordedAt: json['recordedAt'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'coordinates': coordinates.toJson(),
      'child': childId,
      'accuracy': accuracy,
      'recordedAt': recordedAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
