import 'package:covid_19_application/model/nigeria_cases.dart';
import 'package:intl/intl.dart';

class NigeriaCasesViewModel {
  final NigeriaCases _nigeriaCases;
  NigeriaCasesViewModel({NigeriaCases nigeriaCases})
      : _nigeriaCases = nigeriaCases;

  dynamic get newConfirmed =>
      NumberFormat('#,###,###,###').format(_nigeriaCases.newConfirmed);
  dynamic get totalConfirmed =>
      NumberFormat('#,###,###,###').format(_nigeriaCases.totalConfirmed);
  dynamic get newDeaths =>
      NumberFormat('#,###,###,###').format(_nigeriaCases.newDeaths);
  dynamic get totalDeaths =>
      NumberFormat('#,###,###,###').format(_nigeriaCases.totalDeaths);
  dynamic get newRecovered =>
      NumberFormat('#,###,###,###').format(_nigeriaCases.newRecovered);
  dynamic get totalRecovered =>
      NumberFormat('#,###,###,###').format(_nigeriaCases.totalRecovered);
  // dynamic get date => DateFormat().add_Hms().format(_nigeriaCases.date);

  String get country => _nigeriaCases.country;
  String get countryCode => _nigeriaCases.countryCode;
  dynamic get isExpand => _nigeriaCases.isExpanded;
  set expanded(bool isExpanded) {
    _nigeriaCases.isExpanded = isExpanded;
  }
}
