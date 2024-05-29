class Host {
  final String hostname;
  final String ip;
  final int port;
  final String info;
  final String info2;
  final String id;
  final String key;
  final Location location;

  Host({
    required this.hostname,
    required this.ip,
    required this.port,
    required this.info,
    required this.info2,
    required this.id,
    required this.key,
    required this.location,
  });

  factory Host.defaultResult() {
    return Host(
      hostname: '',
      ip: '',
      port: 0,
      info: '',
      info2: '',
      id: '',
      key: '',
      location: Location.defaultResult(),
    );
  }

  factory Host.fromJson(Map<String, dynamic> json) {
    return Host(
      hostname: json['hostname'],
      ip: json['ip'],
      port: json['port'],
      info: json['info'],
      info2: json['info2'],
      id: json['id'],
      key: json['key'],
      location: json['location'],
    );
  }
}

class Location {
  final String country;
  final String short;
  final String name;

  Location({required this.country, required this.short, required this.name});

  factory Location.defaultResult() {
    return Location(country: '', short: '', name: '');
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      short: json['short'],
      name: json['name'],
    );
  }
}
