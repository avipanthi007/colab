class TriggerPermit {
  final bool success;
  final String message;

  TriggerPermit({required this.success, required this.message});

  factory TriggerPermit.fromJson(Map<String, dynamic> json) {
    return TriggerPermit(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
    };
  }
}
