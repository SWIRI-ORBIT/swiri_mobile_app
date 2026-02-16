class Child {
  final String id;
  final String name;
  final String dateOfBirth;
  final List<String> guardians;
  final String createdAt;
  final String updatedAt;

  Child({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.guardians,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      guardians: List<String>.from(json['guardians'] ?? []),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'guardians': guardians,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
