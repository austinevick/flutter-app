import 'dart:convert';

import 'package:covid_19_application/apikey.dart';
import 'package:covid_19_application/model/countries.dart';
import 'package:covid_19_application/model/global_cases.dart';
import 'package:covid_19_application/model/nigeria_cases.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future getGlobalCases() async {
    try {
      final String url = 'https://covid-19-data.p.rapidapi.com/totals';

      final response = await http.get(url, headers: {
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "$apikey",
      });
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        Iterable iterable = result;
        print(result);
        return iterable.map((map) => GlobalCases.fromMap(map)).toList();
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future getDailyReports() async {
    try {
      final String url = 'https://covid-19-data.p.rapidapi.com/report/totals';

      final response = await http.get(url, headers: {
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "$apikey",
      });
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        Iterable iterable = result;
        print(iterable);
        //return iterable.map((map) => GlobalCases.fromMap(map)).toList();
      }
      print(response.statusCode);
    } catch (e) {
      return e.toString();
    }
  }

  Future getNigeriaCases() async {
    try {
      final String url = 'https://api.covid19api.com/summary#';
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        Iterable iterable = result['Countries'];
        print(iterable);
        return iterable.map((map) => NigeriaCases.fromMap(map)).toList();
      }
      print(response.statusCode);
    } catch (e) {
      return e.toString();
    }
  }

  Future getListOfCountries() async {
    try {
      final String url = 'https://restcountries.eu/rest/v2/all';
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        Iterable iterable = result['Countries'];
        print(result);
        return iterable.map((map) => Countries.fromMap(map)).toList();
      }
    } catch (e) {
      return e.toString();
    }
  }
}
