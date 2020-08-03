class NigeriaCases {
  final String country;
  final String countryCode;
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  DateTime date;
  bool isExpanded;

  NigeriaCases(
      {this.country,
      this.isExpanded = false,
      this.countryCode,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered,
      this.date});

  factory NigeriaCases.fromMap(Map<String, dynamic> map) {
    return NigeriaCases(
      country: map['Country'],
      countryCode: map['CountryCode'],
      date: map['Date'] ?? '',
      newConfirmed: map['NewConfirmed'],
      totalConfirmed: map['TotalConfirmed'],
      newDeaths: map['NewDeaths'],
      totalDeaths: map['TotalDeaths'],
      newRecovered: map['NewRecovered'],
      totalRecovered: map['TotalRecovered'],
    );
  }
}
