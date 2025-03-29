import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PermitConfig {
  final bool success;
  final List<PermitConfigData> permitData;

  PermitConfig({
    required this.success,
    required this.permitData,
  });

  factory PermitConfig.fromJson(Map<String, dynamic> json) {
    return PermitConfig(
      success: json['success'] ?? false,
      permitData: json['permitData'] != null
          ? List<PermitConfigData>.from(
              json['permitData'].map((x) => PermitConfigData.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'permitData': permitData.map((x) => x.toJson()).toList(),
    };
  }
}

class PermitConfigData {
  final int id;
  final int clientId;
  final int projectId;
  final int createdBy;
  final String permitName;
  final String permitType;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic syncId;
  final DateTime syncAt;
  final dynamic updatedBy;
  final int isArchived;

  final List<PermitSectionInfo> permitSectionInfo;
  final List<PermitApproveInfo> permitApproveInfo;
  List<LabourItem> permitTriggerLabours = <LabourItem>[].obs;
  RxInt? getActivityHeadId;
  RxInt? getActivityId;

  RxString getPermitDate = "".obs;
  RxString getStartTime = "".obs;
  RxString getEndTime = "".obs;
  RxInt locationId = 0.obs;
  RxInt subLocationId = 0.obs;
  RxInt subSubLocationId = 0.obs;
  String userInputTexts = '';
  final userInput = TextEditingController();
  final Rx<File?> imgUploaded = Rx<File?>(null);
  RxInt getContractorId = 0.obs;

  PermitConfigData({
    required this.id,
    required this.clientId,
    required this.projectId,
    required this.createdBy,
    required this.permitName,
    required this.permitType,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.syncId,
    required this.syncAt,
    this.updatedBy,
    required this.isArchived,
    required this.permitSectionInfo,
    required this.permitApproveInfo,
  });

  factory PermitConfigData.fromJson(Map<String, dynamic> json) {
    return PermitConfigData(
      id: json['id'] ?? 0,
      clientId: json['client_id'] ?? 0,
      projectId: json['project_id'] ?? 0,
      createdBy: json['created_by'] ?? 0,
      permitName: json['permit_name'] ?? '',
      permitType: json['permit_type'] ?? '',
      description: json['description'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
      syncId: json['sync_id'],
      syncAt: json['sync_at'] != null
          ? DateTime.parse(json['sync_at'])
          : DateTime.now(),
      updatedBy: json['updated_by'],
      isArchived: json['is_archived'] ?? 0,
      permitSectionInfo: json['permitSectionInfo'] != null
          ? List<PermitSectionInfo>.from(json['permitSectionInfo']
              .map((x) => PermitSectionInfo.fromJson(x)))
          : [],
      permitApproveInfo: json['permitApproveInfo'] != null
          ? List<PermitApproveInfo>.from(json['permitApproveInfo']
              .map((x) => PermitApproveInfo.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client_id': clientId,
      'project_id': projectId,
      'created_by': createdBy,
      'permit_name': permitName,
      'permit_type': permitType,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'sync_id': syncId,
      'sync_at': syncAt.toIso8601String(),
      'updated_by': updatedBy,
      'is_archived': isArchived,
      'permitSectionInfo': permitSectionInfo.map((x) => x.toJson()).toList(),
      'permitApproveInfo': permitApproveInfo.map((x) => x.toJson()).toList(),
    };
  }
}

class LabourItem {
  RxString type = "".obs;
  RxInt? quantity;
  RxInt? pwrType;
  Rx<TextEditingController>? labourInput = TextEditingController().obs;
}

class PermitSectionInfo {
  final int id;
  final int clientId;
  final int projectId;
  final int permitId;
  final String sectionName;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic syncId;
  final DateTime syncAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final int isArchived;

  final List<PermitSectionLinkInfo> permitSectionLinkInfo;

  PermitSectionInfo({
    required this.id,
    required this.clientId,
    required this.projectId,
    required this.permitId,
    required this.sectionName,
    required this.createdAt,
    required this.updatedAt,
    this.syncId,
    required this.syncAt,
    this.createdBy,
    this.updatedBy,
    required this.isArchived,
    required this.permitSectionLinkInfo,
  });

  factory PermitSectionInfo.fromJson(Map<String, dynamic> json) {
    return PermitSectionInfo(
      id: json['id'] ?? 0,
      clientId: json['client_id'] ?? 0,
      projectId: json['project_id'] ?? 0,
      permitId: json['permit_id'] ?? 0,
      sectionName: json['section_name'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
      syncId: json['sync_id'],
      syncAt: json['sync_at'] != null
          ? DateTime.parse(json['sync_at'])
          : DateTime.now(),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      isArchived: json['is_archived'] ?? 0,
      permitSectionLinkInfo: json['permitSectionLinkInfo'] != null
          ? List<PermitSectionLinkInfo>.from(json['permitSectionLinkInfo']
              .map((x) => PermitSectionLinkInfo.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client_id': clientId,
      'project_id': projectId,
      'permit_id': permitId,
      'section_name': sectionName,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'sync_id': syncId,
      'sync_at': syncAt.toIso8601String(),
      'created_by': createdBy,
      'updated_by': updatedBy,
      'is_archived': isArchived,
      'permitSectionLinkInfo':
          permitSectionLinkInfo.map((x) => x.toJson()).toList(),
    };
  }
}

class PermitSectionLinkInfo {
  final int id;
  final int permitId;
  final int permitSectionId;
  final String question;
  final int lineComment;
  final int image;
  final int hideCheck;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic syncId;
  final DateTime syncAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final int isArchived;
  String userInputTexts = '';
  final userInput = TextEditingController();
  final hideCheckManually = false.obs;
  final Rx<File?> imgUploaded = Rx<File?>(null);

  PermitSectionLinkInfo({
    required this.id,
    required this.permitId,
    required this.permitSectionId,
    required this.question,
    required this.lineComment,
    required this.image,
    required this.hideCheck,
    required this.createdAt,
    required this.updatedAt,
    this.syncId,
    required this.syncAt,
    this.createdBy,
    this.updatedBy,
    required this.isArchived,
  });

  factory PermitSectionLinkInfo.fromJson(Map<String, dynamic> json) {
    return PermitSectionLinkInfo(
      id: json['id'] ?? 0,
      permitId: json['permit_id'] ?? 0,
      permitSectionId: json['permit_section_id'] ?? 0,
      question: json['question'] ?? '',
      lineComment: json['line_comment'] ?? 0,
      image: json['image'] ?? 0,
      hideCheck: json['hide_check'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
      syncId: json['sync_id'],
      syncAt: json['sync_at'] != null
          ? DateTime.parse(json['sync_at'])
          : DateTime.now(),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      isArchived: json['is_archived'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'permit_id': permitId,
      'permit_section_id': permitSectionId,
      'question': question,
      'line_comment': lineComment,
      'image': image,
      'hide_check': hideCheck,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'sync_id': syncId,
      'sync_at': syncAt.toIso8601String(),
      'created_by': createdBy,
      'updated_by': updatedBy,
      'is_archived': isArchived,
    };
  }
}

class PermitApproveInfo {
  final int id;
  final String permitUsersName;
  RxList approversData = [].obs;
  RxList coRequesterData = [].obs;

  PermitApproveInfo({
    required this.id,
    required this.permitUsersName,
  });

  factory PermitApproveInfo.fromJson(Map<String, dynamic> json) {
    return PermitApproveInfo(
      id: json['id'] ?? 0,
      permitUsersName: json['permit_users_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'permit_users_name': permitUsersName,
    };
  }
}
