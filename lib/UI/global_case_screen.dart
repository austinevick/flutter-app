import 'package:covid_19_application/viewmodel/global_cases_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalCasePage extends StatefulWidget {
  @override
  _GlobalCasePageState createState() => _GlobalCasePageState();
}

class _GlobalCasePageState extends State<GlobalCasePage> {
  @override
  void initState() {
    Provider.of<GlobalCasesListViewModel>(context, listen: false)
        .fetchGlobalCases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<GlobalCasesListViewModel>(context);
    return Scaffold(
        body: p.globalCases.isEmpty
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
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : RefreshIndicator(
                onRefresh: () => p.fetchGlobalCases(),
                child: ListView.builder(
                    itemCount: p.globalCases.length,
                    itemBuilder: (context, i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: buildStatCard(
                                      color: Colors.orange,
                                      title: 'Total Cases',
                                      count: p.globalCases[i].totalConfirmed
                                          .toString())),
                              Expanded(
                                  child: buildStatCard(
                                      color: Colors.red,
                                      title: 'Deaths',
                                      count: p.globalCases[i].totalDeaths
                                          .toString())),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: buildStatCard(
                                      color: Colors.green,
                                      title: 'Recovered',
                                      count: p.globalCases[i].totalRecovered
                                          .toString())),
                              Expanded(
                                  child: buildStatCard(
                                      color: Colors.purple,
                                      title: 'Critical',
                                      count: p.globalCases[i].critical
                                          .toString())),
                            ],
                          ),
                        ],
                      );
                    }),
              ));
  }

  buildStatCard({String title, String count, MaterialColor color}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        alignment: Alignment.center,
        height: 80,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
