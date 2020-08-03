import 'package:covid_19_application/model/global_cases.dart';
import 'package:intl/intl.dart';

class GlobalCasesViewModel {
  final GlobalCases _globalCases;
  GlobalCasesViewModel({GlobalCases globalCases}) : _globalCases = globalCases;

  dynamic get totalConfirmed =>
      NumberFormat('#,###,###,###').format(_globalCases.totalConfirmed);
  dynamic get totalDeaths =>
      NumberFormat('#,###,###,###').format(_globalCases.totalDeaths);
  dynamic get totalRecovered =>
      NumberFormat('#,###,###,###').format(_globalCases.totalRecovered);
  dynamic get critical =>
      NumberFormat('#,###,###,###').format(_globalCases.critical);
  String get lastUpdated => _globalCases.lastUpdated;
}
