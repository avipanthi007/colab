class Approvers {
  final String userId;
  final String name;
  final int id;
  final String emailId;
  final String firstName;
  final String lastName;
  final String? userDesignation;
  final String? contractorCompanyName;
  final String? userCompanyName;

  Approvers({
    required this.userId,
    required this.name,
    required this.id,
    required this.emailId,
    required this.firstName,
    required this.lastName,
    this.userDesignation,
    this.contractorCompanyName,
    this.userCompanyName,
  });

  factory Approvers.fromJson(Map<String, dynamic> json) {
    return Approvers(
      userId: json['user_id'] ?? '',
      name: json['name'] ?? '',
      id: json['id'] ?? 0,
      emailId: json['email_id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      userDesignation: json['user_designation'],
      contractorCompanyName: json['contractor_company_name'],
      userCompanyName: json['user_company_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'id': id,
      'email_id': emailId,
      'first_name': firstName,
      'last_name': lastName,
      'user_designation': userDesignation,
      'contractor_company_name': contractorCompanyName,
      'user_company_name': userCompanyName,
    };
  }
}

// Example usage to parse the response
List<Approvers> parseUsers(Map<String, dynamic> response) {
  if (response['success'] == true && response['data'] is List) {
    return (response['data'] as List)
        .map((userData) => Approvers.fromJson(userData))
        .toList();
  }
  return [];
}
