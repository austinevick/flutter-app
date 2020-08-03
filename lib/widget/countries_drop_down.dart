import 'package:covid_19_application/viewmodel/countries_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CountryDropdown extends StatefulWidget {
  @override
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  String _country = 'NG';
  @override
  void initState() {
    Provider.of<CountriesListViewModel>(context, listen: false)
        .getListOfCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<CountriesListViewModel>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 20,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
        items: p.countries
            .map((e) => DropdownMenuItem(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 20,
                        child: SvgPicture.network(
                          e.flag,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        e.name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  value: e,
                ))
            .toList(),
        onChanged: (val) => setState(() => _country = val),
        value: _country,
      )),
    );
  }
}
