class Dates {
  final String name;
  final int sstpCount;
  final int byteSize;

  Dates({required this.name, required this.sstpCount, required this.byteSize});

  factory Dates.defaultResult() {
    return Dates(name: '', sstpCount: 0, byteSize: 0);
  }

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      name: json['name'],
      sstpCount: json['sstpCount'],
      byteSize: json['byteSize'],
    );
  }
}
