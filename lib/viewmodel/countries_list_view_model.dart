import 'package:covid_19_application/model/countries.dart';
import 'package:covid_19_application/viewmodel/countries_view_model.dart';
import 'package:covid_19_application/webservice/webservice.dart';
import 'package:flutter/cupertino.dart';

class CountriesListViewModel with ChangeNotifier {
  List<CountriesViewModel> countries = List<CountriesViewModel>();
  Future getListOfCountries() async {
    List<Countries> list = await Webservice().getListOfCountries();
    this.countries =
        list.map((map) => CountriesViewModel(countries: map)).toList();
    notifyListeners();
  }
}
