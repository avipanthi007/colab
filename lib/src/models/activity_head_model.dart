import 'package:colab/src/models/linking_activity_model.dart';

class ActivityHead {
  final int activityId;
  final int activityTypeId;
  final String activityHead;
  final int activityHeadOrder;
  final int isManualPresent;
  List<LinkingActivity> linkingData = [];

  ActivityHead({
    required this.activityId,
    required this.activityTypeId,
    required this.activityHead,
    required this.activityHeadOrder,
    required this.isManualPresent,
  });

  factory ActivityHead.fromJson(Map<String, dynamic> json) {
    return ActivityHead(
      activityId: json['activity_id'] ?? 0,
      activityTypeId: json['activity_type_id'] ?? 0,
      activityHead: json['activity_head'] ?? '',
      activityHeadOrder: json['activity_head_order'] ?? 0,
      isManualPresent: json['is_manual_present'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activity_id': activityId,
      'activity_type_id': activityTypeId,
      'activity_head': activityHead,
      'activity_head_order': activityHeadOrder,
      'is_manual_present': isManualPresent,
      'linking_data': linkingData.map((data) => data.toJson()).toList(),
    };
  }
}
