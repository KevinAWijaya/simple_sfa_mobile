enum FailedReason {
  pilihAlasan("Pilih Alasan"),
  pemilikSibuk("Pemilik Sibuk"),
  tokoTutup("Toko Tutup");

  final String label;
  const FailedReason(this.label);

  static List<String> get valuesList => FailedReason.values.map((e) => e.label).toList();
}
