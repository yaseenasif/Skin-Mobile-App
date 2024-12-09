class ScanResultModel {
  final String id;
  final String date;
  final String riskLevel;
  final String confidence;

  ScanResultModel({
    required this.id,
    required this.date,
    required this.riskLevel,
    required this.confidence,
  });

  factory ScanResultModel.fromJson(Map<String, dynamic> json) {
    return ScanResultModel(
      id: json['id'],
      date: json['date'],
      riskLevel: json['riskLevel'],
      confidence: json['confidence'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'riskLevel': riskLevel,
      'confidence': confidence,
    };
  }
}
