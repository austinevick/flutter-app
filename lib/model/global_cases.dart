class GlobalCases {
  final int totalConfirmed;
  final int critical;
  final int totalDeaths;
  final String lastUpdated;
  final int totalRecovered;

  GlobalCases(
      {this.totalConfirmed,
      this.critical,
      this.totalDeaths,
      this.lastUpdated,
      this.totalRecovered});

  factory GlobalCases.fromMap(Map<String, dynamic> map) {
    return GlobalCases(
        totalConfirmed: map['confirmed'],
        critical: map['critical'],
        totalDeaths: map['deaths'],
        lastUpdated: map['lastUpdated'],
        totalRecovered: map['recovered']);
  }
}
