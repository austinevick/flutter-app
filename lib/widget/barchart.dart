import 'package:covid_19_application/viewmodel/global_cases_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class Covid19BarChart extends StatefulWidget {
  @override
  _Covid19BarChartState createState() => _Covid19BarChartState();
}

class _Covid19BarChartState extends State<Covid19BarChart> {
  List<charts.Series> seriesList;

  static List<charts.Series<dynamic, String>> createChartData(
      BuildContext context) {
    final p = Provider.of<GlobalCasesListViewModel>(context, listen: false);

    return [
      charts.Series(
        data: p.globalCases,
        id: '1',
        domainFn: (datum, index) => p.globalCases[index].critical,
        measureFn: (datum, index) => p.globalCases[index].totalConfirmed,
      )
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: false,
    );
  }

  @override
  void initState() {
    seriesList = createChartData(context);
    Provider.of<GlobalCasesListViewModel>(context, listen: false)
        .fetchGlobalCases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          )),
      child: barChart(),
    );
  }
}

class Sales {
  final String year;
  final int sales;

  Sales(this.year, this.sales);
}
