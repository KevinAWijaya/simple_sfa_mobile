class CustomerTthDetail {
  int? iD;
  String? tTHNo;
  String? tTOTTPNo;
  String? jenis;
  int? qty;
  String? unit;

  CustomerTthDetail({this.iD, this.tTHNo, this.tTOTTPNo, this.jenis, this.qty, this.unit});

  CustomerTthDetail.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    tTHNo = json['TTHNo'];
    tTOTTPNo = json['TTOTTPNo'];
    jenis = json['Jenis'];
    qty = json['Qty'];
    unit = json['Unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['TTHNo'] = tTHNo;
    data['TTOTTPNo'] = tTOTTPNo;
    data['Jenis'] = jenis;
    data['Qty'] = qty;
    data['Unit'] = unit;
    return data;
  }
}
