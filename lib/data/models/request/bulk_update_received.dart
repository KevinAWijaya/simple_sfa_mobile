class RequestBulkUpdate {
  int? received;
  String? receivedDate;
  String? failedReason;

  RequestBulkUpdate({this.received, this.receivedDate, this.failedReason});

  RequestBulkUpdate.fromJson(Map<String, dynamic> json) {
    received = json['Received'];
    receivedDate = json['ReceivedDate'];
    failedReason = json['FailedReason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Received'] = received;
    data['ReceivedDate'] = receivedDate;
    data['FailedReason'] = failedReason;
    return data;
  }
}
