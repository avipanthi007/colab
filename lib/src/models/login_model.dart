import 'dart:convert';

class LoginModel {
  final bool success;
  final String token;
  final UserData data;

  LoginModel({
    required this.success,
    required this.token,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'],
      token: json['token'],
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'token': token,
      'data': data.toJson(),
    };
  }
}

class UserData {
  final int? typeId;
  final String roleName;
  final int id;
  final int clientId;
  final String userId;
  final String password;
  final String name;
  final String rm;
  final String mobileNo;
  final String emailId;
  final int? roleId;
  final int rmId;
  final int status;
  final int userType;
  final String lastName;
  final int designation;
  final String altMobileNo;
  final String emergencyName;
  final String emergencyMobileNo;
  final String dob;
  final int departmentId;
  final String doj;
  final int? vendorMasterId;
  final String userImage;
  final String fcmToken;
  final String? passResetUserToken;
  final String createdAt;
  final String updatedAt;
  final int? createdBy;
  final int? updatedBy;
  final int isArchived;
  final int s3SyncStatus;
  final String? s3Key;
  final String? fileId;
  final String projectCreatedAt;
  final String companyCorporateAddress;
  final String clientImage;

  UserData({
    this.typeId,
    required this.roleName,
    required this.id,
    required this.clientId,
    required this.userId,
    required this.password,
    required this.name,
    required this.rm,
    required this.mobileNo,
    required this.emailId,
    this.roleId,
    required this.rmId,
    required this.status,
    required this.userType,
    required this.lastName,
    required this.designation,
    required this.altMobileNo,
    required this.emergencyName,
    required this.emergencyMobileNo,
    required this.dob,
    required this.departmentId,
    required this.doj,
    this.vendorMasterId,
    required this.userImage,
    required this.fcmToken,
    this.passResetUserToken,
    required this.createdAt,
    required this.updatedAt,
    this.createdBy,
    this.updatedBy,
    required this.isArchived,
    required this.s3SyncStatus,
    this.s3Key,
    this.fileId,
    required this.projectCreatedAt,
    required this.companyCorporateAddress,
    required this.clientImage,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      typeId: json['type_id'],
      roleName: json['role_name'],
      id: json['id'],
      clientId: json['client_id'],
      userId: json['user_id'],
      password: json['password'],
      name: json['name'],
      rm: json['rm'],
      mobileNo: json['mobile_no'],
      emailId: json['email_id'],
      roleId: json['role_id'],
      rmId: json['rm_id'],
      status: json['status'],
      userType: json['user_type'],
      lastName: json['last_name'],
      designation: json['designation'],
      altMobileNo: json['alt_mobile_no'],
      emergencyName: json['emergency_name'],
      emergencyMobileNo: json['emergency_mobile_no'],
      dob: json['dob'],
      departmentId: json['department_id'],
      doj: json['doj'],
      vendorMasterId: json['vendor_master_id'],
      userImage: json['user_image'],
      fcmToken: json['fcm_token'],
      passResetUserToken: json['pass_reset_user_token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      isArchived: json['is_archived'],
      s3SyncStatus: json['s3_sync_status'],
      s3Key: json['s3_key'],
      fileId: json['file_id'],
      projectCreatedAt: json['project_created_at'],
      companyCorporateAddress: json['company_corporate_address'],
      clientImage: json['client_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type_id': typeId,
      'role_name': roleName,
      'id': id,
      'client_id': clientId,
      'user_id': userId,
      'password': password,
      'name': name,
      'rm': rm,
      'mobile_no': mobileNo,
      'email_id': emailId,
      'role_id': roleId,
      'rm_id': rmId,
      'status': status,
      'user_type': userType,
      'last_name': lastName,
      'designation': designation,
      'alt_mobile_no': altMobileNo,
      'emergency_name': emergencyName,
      'emergency_mobile_no': emergencyMobileNo,
      'dob': dob,
      'department_id': departmentId,
      'doj': doj,
      'vendor_master_id': vendorMasterId,
      'user_image': userImage,
      'fcm_token': fcmToken,
      'pass_reset_user_token': passResetUserToken,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'is_archived': isArchived,
      's3_sync_status': s3SyncStatus,
      's3_key': s3Key,
      'file_id': fileId,
      'project_created_at': projectCreatedAt,
      'company_corporate_address': companyCorporateAddress,
      'client_image': clientImage,
    };
  }
}
