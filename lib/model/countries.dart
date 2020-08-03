class Countries {
  final String name;
  final String flag;

  Countries({this.name, this.flag});
  factory Countries.fromMap(Map<String, dynamic> map) {
    return Countries(name: map['name'], flag: map['flag']);
  }
}
