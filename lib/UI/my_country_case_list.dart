import 'package:covid_19_application/UI/last_updated_date.dart';
import 'package:covid_19_application/constant/styles.dart';
import 'package:covid_19_application/viewmodel/nigeria_cases_list_view_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCountryPage extends StatefulWidget {
  @override
  _MyCountryPageState createState() => _MyCountryPageState();
}

class _MyCountryPageState extends State<MyCountryPage> {
  @override
  void initState() {
    Provider.of<NigeriaCasesListViewModel>(context, listen: false)
        .fetchNigeriaCases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<NigeriaCasesListViewModel>(context);
    return Scaffold(
        body: p.nigeriaCases.isEmpty
            ? Dialog(
                child: Container(
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: 50,
                          child: Center(child: CircularProgressIndicator())),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Please wait...',
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : RefreshIndicator(
                onRefresh: () => p.fetchNigeriaCases(),
                child: ListView.builder(
                    itemCount: p.nigeriaCases.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: <Widget>[
                          // Text(p.nigeriaCases[i].date),
                          ExpansionPanelList(
                            expansionCallback: (panelIndex, isExpanded) {
                              setState(() {
                                p.nigeriaCases[panelIndex].expanded =
                                    !isExpanded;
                              });
                            },
                            children: p.nigeriaCases
                                .map((e) => ExpansionPanel(
                                    canTapOnHeader: true,
                                    headerBuilder: (context, isExpanded) {
                                      return ListTile(
                                        title: Text(
                                          e.country,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      );
                                    },
                                    body: Column(
                                      children: <Widget>[
                                        Card(
                                          color: Colors.blue,
                                          child: ListTile(
                                            subtitle: Text(
                                              e.totalConfirmed,
                                              style: Styles.subtitleStyle,
                                            ),
                                            title: Text('Total Cases',
                                                style: Styles.titleStyle),
                                          ),
                                        ),
                                        Card(
                                          color: Colors.red,
                                          child: ListTile(
                                            subtitle: Text(
                                              e.totalDeaths,
                                              style: Styles.subtitleStyle,
                                            ),
                                            title: Text(
                                              'Deaths',
                                              style: Styles.titleStyle,
                                            ),
                                          ),
                                        ),
                                        Card(
                                          color: Colors.green,
                                          child: ListTile(
                                            subtitle: Text(
                                              e.totalRecovered,
                                              style: Styles.subtitleStyle,
                                            ),
                                            title: Text(
                                              'recovered',
                                              style: Styles.titleStyle,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    isExpanded: e.isExpand))
                                .toList(),
                          ),
                        ],
                      );
                    }),
              ));
  }
}
