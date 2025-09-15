class UpdateMessage {
  String? message;
  int? updatedRows;

  UpdateMessage({this.message, this.updatedRows});

  UpdateMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    updatedRows = json['updated_rows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['updated_rows'] = updatedRows;
    return data;
  }
}
