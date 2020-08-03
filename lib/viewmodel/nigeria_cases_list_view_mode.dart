import 'package:covid_19_application/model/nigeria_cases.dart';
import 'package:covid_19_application/viewmodel/nigeria_cases_view_model.dart';
import 'package:covid_19_application/webservice/webservice.dart';
import 'package:flutter/cupertino.dart';

class NigeriaCasesListViewModel with ChangeNotifier {
  List<NigeriaCasesViewModel> nigeriaCases = List<NigeriaCasesViewModel>();

  Future<void> fetchNigeriaCases() async {
    List<NigeriaCases> cases = await Webservice().getNigeriaCases();
    this.nigeriaCases = cases
        .map((nigeriaCase) => NigeriaCasesViewModel(nigeriaCases: nigeriaCase))
        .toList();
    notifyListeners();
  }
}
