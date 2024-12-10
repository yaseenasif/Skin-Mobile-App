class ScanResultModel {
  final String id;
  final String name;
  final String description;
  final String treatment;

  ScanResultModel({
    required this.id,
    required this.name,
    required this.description,
    required this.treatment,
  });

  factory ScanResultModel.fromJson(Map<String, dynamic> json) {
    return ScanResultModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      treatment: json['treatment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
