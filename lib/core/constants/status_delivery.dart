enum StatusDelivery {
  notDelivered("Belum Diberikan"),
  acceptedDelivered("Sudah Diterima"),
  rejectedDelivery("Gagal Diterima");

  final String label;
  const StatusDelivery(this.label);

  static List<String> get valuesList => StatusDelivery.values.map((e) => e.label).toList();
}
