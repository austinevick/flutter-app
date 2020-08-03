import 'package:covid_19_application/model/countries.dart';

class CountriesViewModel {
  final Countries _countries;
  CountriesViewModel({Countries countries}) : _countries = countries;

  String get name => _countries.name;
  String get flag => _countries.flag;
}
