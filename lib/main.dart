import 'package:covid_19_application/UI/bottom_nav_screen.dart';
import 'package:covid_19_application/UI/homepage.dart';
import 'package:covid_19_application/viewmodel/countries_list_view_model.dart';
import 'package:covid_19_application/viewmodel/global_cases_list_view_model.dart';
import 'package:covid_19_application/viewmodel/nigeria_cases_list_view_mode.dart';
import 'package:covid_19_application/webservice/webservice.dart';
import 'package:covid_19_application/widget/barchart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountriesListViewModel()),
        ChangeNotifierProvider(create: (context) => GlobalCasesListViewModel()),
        ChangeNotifierProvider(
            create: (context) => NigeriaCasesListViewModel()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: BottomNavScreen()),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  void initState() {
    Provider.of<NigeriaCasesListViewModel>(context, listen: false)
        .fetchNigeriaCases();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<NigeriaCasesListViewModel>(context);
    // Webservice().getDailyReports();
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              p.nigeriaCases[panelIndex].expanded = !isExpanded;
            });
          },
          children: p.nigeriaCases
              .map((e) => ExpansionPanel(
                  canTapOnHeader: true,
                  headerBuilder: (context, isExpanded) {
                    return Text('Total Cases');
                  },
                  body: ListTile(
                    subtitle: Text(e.totalConfirmed),
                    title: Text(e.country),
                  ),
                  isExpanded: e.isExpand))
              .toList(),
        ),
      ),
    ));
  }
}
