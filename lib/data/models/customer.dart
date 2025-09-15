class Customer {
  String? custID;
  String? name;
  String? address;
  String? branchCode;
  String? phoneNo;

  Customer({this.custID, this.name, this.address, this.branchCode, this.phoneNo});

  Customer.fromJson(Map<String, dynamic> json) {
    custID = json['CustID'];
    name = json['Name'];
    address = json['Address'];
    branchCode = json['BranchCode'];
    phoneNo = json['PhoneNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CustID'] = custID;
    data['Name'] = name;
    data['Address'] = address;
    data['BranchCode'] = branchCode;
    data['PhoneNo'] = phoneNo;
    return data;
  }
}
