import 'package:equatable/equatable.dart';

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

class ResultDates extends Equatable {
  final List<Dates>? dates;
  final String error;

  const ResultDates({this.dates, required this.error});

  factory ResultDates.defaultResult() {
    return const ResultDates(dates: null, error: '');
  }

  @override
  List<Object?> get props => [dates, error];
}
