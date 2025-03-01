class LocationModel {
  final int locationId;
  final String locationName;
  final bool isManualPresent;

  LocationModel({
    required this.locationId,
    required this.locationName,
    required this.isManualPresent,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      locationId: json['location_id'] as int,
      locationName: json['location_name'] as String,
      isManualPresent: (json['is_manual_present'] as int) == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location_id': locationId,
      'location_name': locationName,
      'is_manual_present': isManualPresent ? 1 : 0,
    };
  }
}

class LocationResponse {
  final bool success;
  final String message;
  final List<LocationModel> data;

  LocationResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) {
    return LocationResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}