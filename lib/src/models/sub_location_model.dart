import 'sub_sub_location_model.dart';

class SubLocationResponse {
  final String? message;
  final bool? success;
  final List<SubLocation> data;

  SubLocationResponse({
    this.message,
    this.success,
    required this.data,
  });

  factory SubLocationResponse.fromJson(Map<String, dynamic> json) {
    return SubLocationResponse(
      message: json['message'],
      success: json['success'],
      data: ((json['data'] as List?) ?? [])
          .map((item) => SubLocation.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class SubLocation {
  final int? subLocId;
  final String? subLocationName;
  final int? locationId;
  final int? orderNo;
  final int? isManualPresent;
  List<SubSubLocation> subSubLocations = [];

  SubLocation({
    this.subLocId,
    this.subLocationName,
    this.locationId,
    this.orderNo,
    this.isManualPresent,
  });

  factory SubLocation.fromJson(Map<String, dynamic> json) {
    return SubLocation(
      subLocId: json['sub_loc_id'],
      subLocationName: json['sub_location_name'],
      locationId: json['location_id'],
      orderNo: json['order_no'],
      isManualPresent: json['is_manual_present'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sub_loc_id': subLocId,
      'sub_location_name': subLocationName,
      'location_id': locationId,
      'order_no': orderNo,
      'is_manual_present': isManualPresent,
      'subSubLocations': subSubLocations.map((subSubLoc) => subSubLoc.toJson())
    };
  }
}
