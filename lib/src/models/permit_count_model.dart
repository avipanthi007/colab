class PermitResponse {
  final bool success;
  final PermitCounts permitCounts;

  PermitResponse({
    required this.success,
    required this.permitCounts,
  });

  factory PermitResponse.fromJson(Map<String, dynamic> json) {
    return PermitResponse(
      success: json['success'] as bool? ?? false,
      permitCounts:
          PermitCounts.fromJson(json['permitCounts'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'permitCounts': permitCounts.toJson(),
    };
  }
}

class PermitCounts {
  final int futureCount;
  final int currentCount;
  final int expiredCount;

  PermitCounts({
    required this.futureCount,
    required this.currentCount,
    required this.expiredCount,
  });

  factory PermitCounts.fromJson(Map<String, dynamic> json) {
    return PermitCounts(
      futureCount: json['futureCount'] as int? ?? 0,
      currentCount: json['currentCount'] as int? ?? 0,
      expiredCount: json['expiredCount'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'futureCount': futureCount,
      'currentCount': currentCount,
      'expiredCount': expiredCount,
    };
  }
}
