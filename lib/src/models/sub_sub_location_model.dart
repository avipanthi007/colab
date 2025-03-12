class SubSubLocationResponse {
  final String? message;
  final bool? success;
  final List<SubSubLocation>? data;

  SubSubLocationResponse({this.message, this.success, this.data});

  factory SubSubLocationResponse.fromJson(Map<String, dynamic> json) {
    return SubSubLocationResponse(
      message: json['message'],
      success: json['success'],
      data: (json['data'] as List?)
          ?.map((e) => SubSubLocation.fromJson(e))
          .toList(),
    );
  }
}

class SubSubLocation {
  final int? subLocationId;
  final String? subSubLocationName;
  final int? locationId;
  final int? subLocId;
  final int? isManualPresent;
  final SubSubLocMasterImage? subSubLocMasterImage;
  final List<ViewPoint>? viewPointNumberList;

  SubSubLocation({
    this.subLocationId,
    this.subSubLocationName,
    this.locationId,
    this.subLocId,
    this.isManualPresent,
    this.subSubLocMasterImage,
    this.viewPointNumberList,
  });

  factory SubSubLocation.fromJson(Map<String, dynamic> json) {
    return SubSubLocation(
      subLocationId: json['sub_location_id'],
      subSubLocationName: json['sub_sub_location_name'],
      locationId: json['location_id'],
      subLocId: json['sub_loc_id'],
      isManualPresent: json['is_manual_present'],
      subSubLocMasterImage: json['sub_sub_loc_master_image'] != null
          ? SubSubLocMasterImage.fromJson(json['sub_sub_loc_master_image'])
          : null,
      viewPointNumberList: (json['viewPointNumberlist'] as List?)
          ?.map((e) => ViewPoint.fromJson(e))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'sub_location_id': subLocationId,
      'sub_sub_location_name': subSubLocationName,
      'location_id': locationId,
      'sub_loc_id': subLocId,
      'is_manual_present': isManualPresent,
      'sub_sub_loc_master_image': subSubLocMasterImage,
      'viewPointNumberlist': viewPointNumberList,
    };
  }
}

class SubSubLocMasterImage {
  final int? id;
  final int? viewpointMasterId;
  final int? locationId;
  final int? subLocId;
  final int? subSubLocationId;
  final String? subSubLocImage;
  final String? createdAt;
  final String? updatedAt;
  final int? isArchived;
  final int? s3SyncStatus;

  SubSubLocMasterImage({
    this.id,
    this.viewpointMasterId,
    this.locationId,
    this.subLocId,
    this.subSubLocationId,
    this.subSubLocImage,
    this.createdAt,
    this.updatedAt,
    this.isArchived,
    this.s3SyncStatus,
  });

  factory SubSubLocMasterImage.fromJson(Map<String, dynamic> json) {
    return SubSubLocMasterImage(
      id: json['id'],
      viewpointMasterId: json['viewpoint_master_id'],
      locationId: json['location_id'],
      subLocId: json['sub_loc_id'],
      subSubLocationId: json['sub_sub_location_id'],
      subSubLocImage: json['sub_sub_loc_image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isArchived: json['is_archived'],
      s3SyncStatus: json['s3_sync_status'],
    );
  }
}

class ViewPoint {
  final int? id;
  final int? viewpointSubSubLocId;
  final int? subSubLocationId;
  final String? viewpoint;
  final int? viewpointMasterId;
  final String? createdAt;
  final String? updatedAt;
  final int? isArchived;

  ViewPoint({
    this.id,
    this.viewpointSubSubLocId,
    this.subSubLocationId,
    this.viewpoint,
    this.viewpointMasterId,
    this.createdAt,
    this.updatedAt,
    this.isArchived,
  });

  factory ViewPoint.fromJson(Map<String, dynamic> json) {
    return ViewPoint(
      id: json['id'],
      viewpointSubSubLocId: json['viewpoint_sub_sub_loc_id'],
      subSubLocationId: json['sub_sub_location_id'],
      viewpoint: json['viewpoint'],
      viewpointMasterId: json['viewpoint_master_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isArchived: json['is_archived'],
    );
  }
}
