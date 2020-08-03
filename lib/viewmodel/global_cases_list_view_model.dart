import 'package:covid_19_application/model/global_cases.dart';
import 'package:covid_19_application/viewmodel/global_cases_view_model.dart';
import 'package:covid_19_application/webservice/webservice.dart';
import 'package:flutter/cupertino.dart';

class GlobalCasesListViewModel with ChangeNotifier {
  List<GlobalCasesViewModel> globalCases = List<GlobalCasesViewModel>();
  Future<void> fetchGlobalCases() async {
    List<GlobalCases> cases = await Webservice().getGlobalCases();
    this.globalCases = cases
        .map((globalCase) => GlobalCasesViewModel(globalCases: globalCase))
        .toList();
    notifyListeners();
  }
}
