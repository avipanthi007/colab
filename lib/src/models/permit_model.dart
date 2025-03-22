import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PermitModel {
  final bool success;
  final List<PermitData> permitData;

  PermitModel({required this.success, required this.permitData});

  factory PermitModel.fromJson(Map<String, dynamic> json) {
    return PermitModel(
      success: json['success'] ?? false,
      permitData: List<PermitData>.from((json['permitData']?['results'] ?? [])
          .map((x) => PermitData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'permitData': {
        'results': permitData.map((x) => x.toJson()).toList(),
      },
    };
  }
}

class PermitData {
  final int id;
  final int clientId;
  final int projectId;
  final int createdBy;
  final int permitId;
  final String? permitName;
  final String? permitType;
  final String? description;
  int? locationId;
  int? subLocationId;
  int? subSubLocationId;
  int? activityHeadId;
  int? activityId;
  String? permitDate;
  String? startTime;
  String? endTime;
  final int triggerBy;
  final int status;
  final int contractorId;
  final String? offlineRandomId;
  final String createdAt;
  final String updatedAt;
  final double? lat;
  final double? lng;
  final int? syncId;
  final String? syncAt;
  final int? updatedBy;
  final int isArchived;
  final int isApprover;
  final int isEditor;
  final String triggerFirstName;
  final String triggerLastName;
  final String triggerUserDesignation;
  final String triggerUserCompanyName;
  final String? activityHead;
  final String triggerName;
  final String? activity;
  final String? activityOrder;
  final String? locationName;
  final String? subLocationName;
  final String contractorName;
  final String? subSubLocationName;
  final List<PermitTriggerSectionInfo> permitTriggerSectionInfo;
  final List<PermitUserRoleInfo> permitUserRoleInfo;
  final List<PermitTriggerLabour> permitTriggerLabours;
  final List<PermitApproverStatus> permitApproverStatus;

  PermitData({
    required this.id,
    required this.clientId,
    required this.projectId,
    required this.createdBy,
    required this.permitId,
    this.permitName,
    this.permitType,
    this.description,
    this.locationId,
    this.subLocationId,
    this.subSubLocationId,
    this.activityHeadId,
    this.activityId,
    this.permitDate,
    this.startTime,
    this.endTime,
    required this.triggerBy,
    required this.status,
    required this.contractorId,
    this.offlineRandomId,
    required this.createdAt,
    required this.updatedAt,
    this.lat,
    this.lng,
    this.syncId,
    this.syncAt,
    this.updatedBy,
    required this.isArchived,
    required this.isApprover,
    required this.isEditor,
    required this.triggerFirstName,
    required this.triggerLastName,
    required this.triggerUserDesignation,
    required this.triggerUserCompanyName,
    this.activityHead,
    required this.triggerName,
    this.activity,
    this.activityOrder,
    this.locationName,
    this.subLocationName,
    required this.contractorName,
    this.subSubLocationName,
    required this.permitTriggerSectionInfo,
    required this.permitUserRoleInfo,
    required this.permitTriggerLabours,
    required this.permitApproverStatus,
  });

  factory PermitData.fromJson(Map<String, dynamic> json) {
    return PermitData(
      id: json['id'] ?? 0,
      clientId: json['client_id'] ?? 0,
      projectId: json['project_id'] ?? 0,
      createdBy: json['created_by'] ?? 0,
      permitId: json['permit_id'] ?? 0,
      permitName: json['permit_name']?.toString(),
      permitType: json['permit_type']?.toString(),
      description: json['description']?.toString(),
      locationId: json['location_id'],
      subLocationId: json['sub_location_id'],
      subSubLocationId: json['sub_sub_location_id'],
      activityHeadId: json['activity_head_id'],
      activityId: json['activity_id'],
      permitDate: json['permit_date']?.toString(),
      startTime: json['start_time']?.toString(),
      endTime: json['end_time']?.toString(),
      triggerBy: json['trigger_by'] ?? 0,
      status: json['status'] ?? 0,
      contractorId: json['contractor_id'] ?? 0,
      offlineRandomId: json['offline_random_id']?.toString(),
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
      lat: json['lat'] != null ? double.tryParse(json['lat'].toString()) : null,
      lng: json['lng'] != null ? double.tryParse(json['lng'].toString()) : null,
      syncId: json['sync_id'],
      syncAt: json['sync_at']?.toString(),
      updatedBy: json['updated_by'],
      isArchived: json['is_archived'] ?? 0,
      isApprover: json['is_approver'] ?? 0,
      isEditor: json['is_editor'] ?? 0,
      triggerFirstName: json['trigger_first_name']?.toString() ?? '',
      triggerLastName: json['trigger_last_name']?.toString() ?? '',
      triggerUserDesignation:
          json['trigger_user_designation']?.toString() ?? '',
      triggerUserCompanyName:
          json['trigger_user_company_name']?.toString() ?? '',
      activityHead: json['activity_head']?.toString(),
      triggerName: json['trigger_name']?.toString() ?? '',
      activity: json['activity']?.toString(),
      activityOrder: json['activity_order']?.toString(),
      locationName: json['location_name']?.toString(),
      subLocationName: json['sub_location_name']?.toString(),
      contractorName: json['contractor_name']?.toString() ?? '',
      subSubLocationName: json['sub_sub_location_name']?.toString(),
      permitTriggerSectionInfo: List<PermitTriggerSectionInfo>.from(
          (json['permitTriggerSectionInfo'] ?? [])
              .map((x) => PermitTriggerSectionInfo.fromJson(x))),
      permitUserRoleInfo: List<PermitUserRoleInfo>.from(
          (json['permitUserRoleInfo'] ?? [])
              .map((x) => PermitUserRoleInfo.fromJson(x))),
      permitTriggerLabours: List<PermitTriggerLabour>.from(
          (json['permitTriggerLabours'] ?? [])
              .map((x) => PermitTriggerLabour.fromJson(x))),
      permitApproverStatus: List<PermitApproverStatus>.from(
          (json['permitApproverStatus'] ?? [])
              .map((x) => PermitApproverStatus.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client_id': clientId,
      'project_id': projectId,
      'created_by': createdBy,
      'permit_id': permitId,
      'permit_name': permitName,
      'permit_type': permitType,
      'description': description,
      'location_id': locationId,
      'sub_location_id': subLocationId,
      'sub_sub_location_id': subSubLocationId,
      'activity_head_id': activityHeadId,
      'activity_id': activityId,
      'permit_date': permitDate,
      'start_time': startTime,
      'end_time': endTime,
      'trigger_by': triggerBy,
      'status': status,
      'contractor_id': contractorId,
      'offline_random_id': offlineRandomId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'lat': lat,
      'lng': lng,
      'sync_id': syncId,
      'sync_at': syncAt,
      'updated_by': updatedBy,
      'is_archived': isArchived,
      'is_approver': isApprover,
      'is_editor': isEditor,
      'trigger_first_name': triggerFirstName,
      'trigger_last_name': triggerLastName,
      'trigger_user_designation': triggerUserDesignation,
      'trigger_user_company_name': triggerUserCompanyName,
      'activity_head': activityHead,
      'trigger_name': triggerName,
      'activity': activity,
      'activity_order': activityOrder,
      'location_name': locationName,
      'sub_location_name': subLocationName,
      'contractor_name': contractorName,
      'sub_sub_location_name': subSubLocationName,
      'permitTriggerSectionInfo':
          permitTriggerSectionInfo.map((x) => x.toJson()).toList(),
      'permitUserRoleInfo': permitUserRoleInfo.map((x) => x.toJson()).toList(),
      'permitTriggerLabours':
          permitTriggerLabours.map((x) => x.toJson()).toList(),
      'permitApproverStatus':
          permitApproverStatus.map((x) => x.toJson()).toList(),
    };
  }
}

class PermitTriggerSectionInfo {
  final int id;
  final int clientId;
  final int projectId;
  final int permitTriggerId;
  final String sectionName;
  final String createdAt;
  final String updatedAt;
  final int? syncId;
  final String? syncAt;
  final int? createdBy;
  final int? updatedBy;
  final int isArchived;
  final List<PermitTriggerSectionLinkInfo> permitTriggerSectionLinkInfo;

  PermitTriggerSectionInfo({
    required this.id,
    required this.clientId,
    required this.projectId,
    required this.permitTriggerId,
    required this.sectionName,
    required this.createdAt,
    required this.updatedAt,
    this.syncId,
    this.syncAt,
    this.createdBy,
    this.updatedBy,
    required this.isArchived,
    required this.permitTriggerSectionLinkInfo,
  });

  factory PermitTriggerSectionInfo.fromJson(Map<String, dynamic> json) {
    return PermitTriggerSectionInfo(
      id: json['id'] ?? 0,
      clientId: json['client_id'] ?? 0,
      projectId: json['project_id'] ?? 0,
      permitTriggerId: json['permit_trigger_id'] ?? 0,
      sectionName: json['section_name']?.toString() ?? '',
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
      syncId: json['sync_id'],
      syncAt: json['sync_at']?.toString(),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      isArchived: json['is_archived'] ?? 0,
      permitTriggerSectionLinkInfo: List<PermitTriggerSectionLinkInfo>.from(
          (json['permitTriggerSectionLinkInfo'] ?? [])
              .map((x) => PermitTriggerSectionLinkInfo.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client_id': clientId,
      'project_id': projectId,
      'permit_trigger_id': permitTriggerId,
      'section_name': sectionName,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'sync_id': syncId,
      'sync_at': syncAt,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'is_archived': isArchived,
      'permitTriggerSectionLinkInfo':
          permitTriggerSectionLinkInfo.map((x) => x.toJson()).toList(),
    };
  }
}

class PermitTriggerSectionLinkInfo {
  final int id;
  final int permitTriggerId;
  final int permitTriggerSectionId;
  final String question;
  final int lineComment;
  final int image;
  final int hideCheck;
  String questionManually;
  final String lineCommentManually;
  String? imageManually;
  final String remark;
  final String? approverItemRemark;
  final String hideCheckManually;
  final String createdAt;
  final String updatedAt;
  final int? syncId;
  final String? syncAt;
  final int? createdBy;
  final int? updatedBy;
  final int isArchived;
  final int s3SyncStatus;
  final String? s3Key;
  final String? fileId;
  final List<dynamic> permitTriggerApproverComment;

  PermitTriggerSectionLinkInfo({
    required this.id,
    required this.permitTriggerId,
    required this.permitTriggerSectionId,
    required this.question,
    required this.lineComment,
    required this.image,
    required this.hideCheck,
    required this.questionManually,
    required this.lineCommentManually,
    this.imageManually,
    required this.remark,
    this.approverItemRemark,
    required this.hideCheckManually,
    required this.createdAt,
    required this.updatedAt,
    this.syncId,
    this.syncAt,
    this.createdBy,
    this.updatedBy,
    required this.isArchived,
    required this.s3SyncStatus,
    this.s3Key,
    this.fileId,
    required this.permitTriggerApproverComment,
  });

  factory PermitTriggerSectionLinkInfo.fromJson(Map<String, dynamic> json) {
    return PermitTriggerSectionLinkInfo(
      id: json['id'] ?? 0,
      permitTriggerId: json['permit_trigger_id'] ?? 0,
      permitTriggerSectionId: json['permit_trigger_section_id'] ?? 0,
      question: json['question']?.toString() ?? '',
      lineComment: json['line_comment'] ?? 0,
      image: json['image'] ?? 0,
      hideCheck: json['hide_check'] ?? 0,
      questionManually: json['question_manually']?.toString() ?? '',
      lineCommentManually: json['line_comment_manually']?.toString() ?? '',
      imageManually: json['image_manually']?.toString(),
      remark: json['remark']?.toString() ?? '',
      approverItemRemark: json['approver_item_remark']?.toString(),
      hideCheckManually: json['hide_check_manually']?.toString() ?? '0',
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
      syncId: json['sync_id'],
      syncAt: json['sync_at']?.toString(),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      isArchived: json['is_archived'] ?? 0,
      s3SyncStatus: json['s3_sync_status'] ?? 0,
      s3Key: json['s3_key']?.toString(),
      fileId: json['file_id']?.toString(),
      permitTriggerApproverComment:
          List<dynamic>.from(json['permitTriggerApproverComment'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'permit_trigger_id': permitTriggerId,
      'permit_trigger_section_id': permitTriggerSectionId,
      'question': question,
      'line_comment': lineComment,
      'image': image,
      'hide_check': hideCheck,
      'question_manually': questionManually,
      'line_comment_manually': lineCommentManually,
      'image_manually': imageManually,
      'remark': remark,
      'approver_item_remark': approverItemRemark,
      'hide_check_manually': hideCheckManually,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'sync_id': syncId,
      'sync_at': syncAt,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'is_archived': isArchived,
      's3_sync_status': s3SyncStatus,
      's3_key': s3Key,
      'file_id': fileId,
      'permitTriggerApproverComment': permitTriggerApproverComment,
    };
  }
}

class PermitUserRoleInfo {
  final int id;
  final int permitTriggerId;
  final int userId;
  final String createdAt;
  final String updatedAt;
  final int? syncId;
  final String? syncAt;
  final int? createdBy;
  final int? updatedBy;
  final int isArchived;
  final String permitUsersName;
  final String firstName;
  final String lastName;
  final String userDesignation;
  final String userCompanyName;

  PermitUserRoleInfo({
    required this.id,
    required this.permitTriggerId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.syncId,
    this.syncAt,
    this.createdBy,
    this.updatedBy,
    required this.isArchived,
    required this.permitUsersName,
    required this.firstName,
    required this.lastName,
    required this.userDesignation,
    required this.userCompanyName,
  });

  factory PermitUserRoleInfo.fromJson(Map<String, dynamic> json) {
    return PermitUserRoleInfo(
      id: json['id'] ?? 0,
      permitTriggerId: json['permit_trigger_id'] ?? 0,
      userId: json['user_id'] ?? 0,
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
      syncId: json['sync_id'],
      syncAt: json['sync_at']?.toString(),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      isArchived: json['is_archived'] ?? 0,
      permitUsersName: json['permit_users_name']?.toString() ?? '',
      firstName: json['first_name']?.toString() ?? '',
      lastName: json['last_name']?.toString() ?? '',
      userDesignation: json['user_designation']?.toString() ?? '',
      userCompanyName: json['user_company_name']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'permit_trigger_id': permitTriggerId,
      'user_id': userId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'sync_id': syncId,
      'sync_at': syncAt,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'is_archived': isArchived,
      'permit_users_name': permitUsersName,
      'first_name': firstName,
      'last_name': lastName,
      'user_designation': userDesignation,
      'user_company_name': userCompanyName,
    };
  }
}

class PermitTriggerLabour {
  final int id;
  final int clientId;
  final int projectId;
  final int permitTriggerId;
  int labourCount;
  final int pwrType;
  final String trade;
  final String createdAt;
  final String updatedAt;
  final int? syncId;
  final String? syncAt;
  final int? createdBy;
  final int? updatedBy;
  final int isArchived;
  final labourInput = TextEditingController();
  String? labourTrade;

  PermitTriggerLabour({
    required this.id,
    required this.clientId,
    required this.projectId,
    required this.permitTriggerId,
    required this.labourCount,
    required this.pwrType,
    required this.trade,
    required this.createdAt,
    required this.updatedAt,
    this.syncId,
    this.syncAt,
    this.createdBy,
    this.updatedBy,
    required this.isArchived,
  });

  factory PermitTriggerLabour.fromJson(Map<String, dynamic> json) {
    return PermitTriggerLabour(
      id: json['id'] ?? 0,
      clientId: json['client_id'] ?? 0,
      projectId: json['project_id'] ?? 0,
      permitTriggerId: json['permit_trigger_id'] ?? 0,
      labourCount: json['labour_count'] ?? 0,
      pwrType: json['pwr_type'] ?? 0,
      trade: json['trade']?.toString() ?? '',
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
      syncId: json['sync_id'],
      syncAt: json['sync_at']?.toString(),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      isArchived: json['is_archived'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client_id': clientId,
      'project_id': projectId,
      'permit_trigger_id': permitTriggerId,
      'labour_count': labourCount,
      'pwr_type': pwrType,
      'trade': trade,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'sync_id': syncId,
      'sync_at': syncAt,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'is_archived': isArchived,
    };
  }
}

class PermitApproverStatus {
  final int id;
  final int permitId;
  final int permitTriggerId;
  final int approveId;
  final int status;
  final String? approvedDate;
  final String? approvedRemark;
  final String createdAt;
  final String updatedAt;
  final double? lat;
  final double? lng;
  final int? syncId;
  final String? syncAt;
  final int? createdBy;
  final int? updatedBy;
  final int isArchived;
  final String permitUsersName;
  final String firstName;
  final String lastName;
  final String userDesignation;
  final String userCompanyName;

  PermitApproverStatus({
    required this.id,
    required this.permitId,
    required this.permitTriggerId,
    required this.approveId,
    required this.status,
    this.approvedDate,
    this.approvedRemark,
    required this.createdAt,
    required this.updatedAt,
    this.lat,
    this.lng,
    this.syncId,
    this.syncAt,
    this.createdBy,
    this.updatedBy,
    required this.isArchived,
    required this.permitUsersName,
    required this.firstName,
    required this.lastName,
    required this.userDesignation,
    required this.userCompanyName,
  });

  factory PermitApproverStatus.fromJson(Map<String, dynamic> json) {
    return PermitApproverStatus(
      id: json['id'] ?? 0,
      permitId: json['permit_id'] ?? 0,
      permitTriggerId: json['permit_trigger_id'] ?? 0,
      approveId: json['approve_id'] ?? 0,
      status: json['status'] ?? 0,
      approvedDate: json['approved_date']?.toString(),
      approvedRemark: json['approved_remark']?.toString(),
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
      lat: json['lat'] != null ? double.tryParse(json['lat'].toString()) : null,
      lng: json['lng'] != null ? double.tryParse(json['lng'].toString()) : null,
      syncId: json['sync_id'],
      syncAt: json['sync_at']?.toString(),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      isArchived: json['is_archived'] ?? 0,
      permitUsersName: json['permit_users_name']?.toString() ?? '',
      firstName: json['first_name']?.toString() ?? '',
      lastName: json['last_name']?.toString() ?? '',
      userDesignation: json['user_designation']?.toString() ?? '',
      userCompanyName: json['user_company_name']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'permit_id': permitId,
      'permit_trigger_id': permitTriggerId,
      'approve_id': approveId,
      'status': status,
      'approved_date': approvedDate,
      'approved_remark': approvedRemark,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'lat': lat,
      'lng': lng,
      'sync_id': syncId,
      'sync_at': syncAt,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'is_archived': isArchived,
      'permit_users_name': permitUsersName,
      'first_name': firstName,
      'last_name': lastName,
      'user_designation': userDesignation,
      'user_company_name': userCompanyName,
    };
  }
}
