class MobileConfig {
  int? iD;
  String? branchCode;
  String? name;
  String? description;
  String? value;

  MobileConfig({this.iD, this.branchCode, this.name, this.description, this.value});

  MobileConfig.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    branchCode = json['BranchCode'];
    name = json['Name'];
    description = json['Description'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['BranchCode'] = branchCode;
    data['Name'] = name;
    data['Description'] = description;
    data['Value'] = value;
    return data;
  }
}
