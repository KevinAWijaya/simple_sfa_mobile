class CustomerTth {
  int? iD;
  String? tTHNo;
  String? salesID;
  String? tTOTTPNo;
  String? custID;
  String? docDate;
  int? received;
  String? receivedDate;
  String? failedReason;

  CustomerTth({this.iD, this.tTHNo, this.salesID, this.tTOTTPNo, this.custID, this.docDate, this.received, this.receivedDate, this.failedReason});

  CustomerTth.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tTHNo = json['TTHNo'];
    salesID = json['SalesID'];
    tTOTTPNo = json['TTOTTPNo'];
    custID = json['CustID'];
    docDate = json['DocDate'];
    received = json['Received'];
    receivedDate = json['ReceivedDate'];
    failedReason = json['FailedReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['TTHNo'] = tTHNo;
    data['SalesID'] = salesID;
    data['TTOTTPNo'] = tTOTTPNo;
    data['CustID'] = custID;
    data['DocDate'] = docDate;
    data['Received'] = received;
    data['ReceivedDate'] = receivedDate;
    data['FailedReason'] = failedReason;
    return data;
  }
}
