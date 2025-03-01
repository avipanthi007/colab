class ContractorsList {
  final int pid;
  final String contractorName;
  final String contactNo;
  final String type;

  ContractorsList({
    required this.pid,
    required this.contractorName,
    required this.contactNo,
    required this.type,
  });

  factory ContractorsList.fromJson(Map<String, dynamic> json) {
    return ContractorsList(
      pid: json['Pid'],
      contractorName: json['contractor_name'],
      contactNo: json['contact_no'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Pid': pid,
      'contractor_name': contractorName,
      'contact_no': contactNo,
      'type': type,
    };
  }
}