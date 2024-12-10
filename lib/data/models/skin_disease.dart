class SkinDisease {
  final int id;
  final String name;
  final String? description;
  final String? treatment;

  SkinDisease({
    required this.id,
    required this.name,
    this.description,
    this.treatment,
  });

  // Factory method to create a SkinDisease from JSON data
  factory SkinDisease.fromJson(Map<String, dynamic> json) {
    return SkinDisease(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      treatment: json['treatment'],
    );
  }

  // Method to convert SkinDisease to JSON (if needed for API requests)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'treatment': treatment,
    };
  }
}
