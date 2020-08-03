import 'package:covid_19_application/UI/global_case_screen.dart';
import 'package:covid_19_application/UI/my_country_case_list.dart';
import 'package:covid_19_application/constant/palette.dart';
import 'package:covid_19_application/constant/styles.dart';
import 'package:flutter/material.dart';

class StatisticScreen extends StatefulWidget {
  @override
  _StatisticScreenState createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.primaryColor,
        appBar: AppBar(
          title: Text('Statistics'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(icon: Icon(Icons.search), onPressed: () {}),
            )
          ],
          elevation: 0,
          backgroundColor: Palette.primaryColor,
          bottom: TabBar(
            labelStyle: Styles.tabTextStyle,
            indicatorColor: Colors.white,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'All Countries',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Global'),
              ),
            ],
            controller: tabController,
          ),
        ),
        body: TabBarView(
            controller: tabController,
            children: [MyCountryPage(), GlobalCasePage()]));
  }
}
