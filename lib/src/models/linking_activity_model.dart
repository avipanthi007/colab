class LinkingActivity {
  final int linkingActivityId;
  final String activity;
  final int activityHeadOrder;
  final int quantity;
  final double? productivity;
  final String activityHead;
  final int activityId;
  final int revisionCode;
  final DateTime plannedStartDate;
  final DateTime plannedEndDate;
  final String? contractorName;
  final String? uomName;
  final int contId;
  final int? id;
  final int locationId;
  final int subLocId;
  final int subLocationId;
  final String? locationName;
  final String? subLocationName;
  final String? subSubLocationName;
  final int isManualPresent;

  LinkingActivity({
    required this.linkingActivityId,
    required this.activity,
    required this.activityHeadOrder,
    required this.quantity,
    this.productivity,
    required this.activityHead,
    required this.activityId,
    required this.revisionCode,
    required this.plannedStartDate,
    required this.plannedEndDate,
    this.contractorName,
    this.uomName,
    required this.contId,
    this.id,
    required this.locationId,
    required this.subLocId,
    required this.subLocationId,
    this.locationName,
    this.subLocationName,
    this.subSubLocationName,
    required this.isManualPresent,
  });

  factory LinkingActivity.fromJson(Map<String, dynamic> json) {
    return LinkingActivity(
      linkingActivityId: json['linking_activity_id'] is String
          ? int.tryParse(json['linking_activity_id'] as String) ?? 0
          : json['linking_activity_id'] as int? ?? 0,
      activity: json['activity'] as String? ?? '',
      activityHeadOrder: json['activity_head_order'] is String
          ? int.tryParse(json['activity_head_order'] as String) ?? 0
          : json['activity_head_order'] as int? ?? 0,
      quantity: json['quantity'] is String
          ? int.tryParse(json['quantity'] as String) ?? 0
          : json['quantity'] as int? ?? 0,
      productivity: json['productivity'] != null
          ? (json['productivity'] is String
              ? double.tryParse(json['productivity'] as String)
              : (json['productivity'] as num).toDouble())
          : null,
      activityHead: json['activity_head'] as String? ?? '',
      activityId: json['activity_id'] is String
          ? int.tryParse(json['activity_id'] as String) ?? 0
          : json['activity_id'] as int? ?? 0,
      revisionCode: json['revision_code'] is String
          ? int.tryParse(json['revision_code'] as String) ?? 0
          : json['revision_code'] as int? ?? 0,
      plannedStartDate: json['planned_start_date'] != null
          ? DateTime.parse(json['planned_start_date'].toString())
          : DateTime.now(),
      plannedEndDate: json['planned_end_date'] != null
          ? DateTime.parse(json['planned_end_date'].toString())
          : DateTime.now(),
      contractorName: json['contractor_name'] as String?,
      uomName: json['uom_name'] as String?,
      contId: json['cont_id'] is String
          ? int.tryParse(json['cont_id'] as String) ?? 0
          : json['cont_id'] as int? ?? 0,
      id: json['id'] is String
          ? int.tryParse(json['id'] as String)
          : json['id'] as int?,
      locationId: json['location_id'] is String
          ? int.tryParse(json['location_id'] as String) ?? 0
          : json['location_id'] as int? ?? 0,
      subLocId: json['sub_loc_id'] is String
          ? int.tryParse(json['sub_loc_id'] as String) ?? 0
          : json['sub_loc_id'] as int? ?? 0,
      subLocationId: json['sub_location_id'] is String
          ? int.tryParse(json['sub_location_id'] as String) ?? 0
          : json['sub_location_id'] as int? ?? 0,
      locationName: json['location_name'] as String?,
      subLocationName: json['sub_location_name'] as String?,
      subSubLocationName: json['sub_sub_location_name'] as String?,
      isManualPresent: json['is_manual_present'] is String
          ? int.tryParse(json['is_manual_present'] as String) ?? 0
          : json['is_manual_present'] as int? ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'linking_activity_id': linkingActivityId,
      'activity': activity,
      'activity_head_order': activityHeadOrder,
      'quantity': quantity,
      'productivity': productivity, // Keep it nullable
      'activity_head': activityHead,
      'activity_id': activityId,
      'revision_code': revisionCode,
      'planned_start_date': plannedStartDate.toIso8601String(),
      'planned_end_date': plannedEndDate.toIso8601String(),
      'contractor_name': contractorName,
      'uom_name': uomName,
      'cont_id': contId,
      'id': id, // Keep it nullable
      'location_id': locationId,
      'sub_loc_id': subLocId,
      'sub_location_id': subLocationId,
      'location_name': locationName,
      'sub_location_name': subLocationName,
      'sub_sub_location_name': subSubLocationName,
      'is_manual_present': isManualPresent,
    };
  }
}
