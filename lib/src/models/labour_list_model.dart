class Trade {
  final int id;
  final String trade;
  final int status;
  final int? createdBy;
  final int? updatedBy;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int isArchived;

  Trade({
    required this.id,
    required this.trade,
    required this.status,
    this.createdBy,
    this.updatedBy,
    required this.createdAt,
    this.updatedAt,
    required this.isArchived,
  });

  factory Trade.fromJson(Map<String, dynamic> json) {
    return Trade(
      id: json['id'] ?? 0,
      trade: json['trade'] ?? '',
      status: json['status'] ?? 0,
      createdBy: json['created_by'], // Now nullable
      updatedBy: json['updated_by'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      isArchived: json['is_archived'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trade': trade,
      'status': status,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'is_archived': isArchived,
    };
  }
}
