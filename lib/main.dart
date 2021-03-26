import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:pie_chart_demo/progress.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pie Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, double> dataMap = {
    "Flutter": 8,
    "React": 2,
  };
  List<Color> colorList = [
    Colors.blue,
    Colors.yellow,
  ];

  ChartType _chartType = ChartType.ring;
  double _ringStrokeWidth = 40;

  bool _showChartValues = false;
  bool _showLegends = false;
  int key = 0;

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartRadius: MediaQuery.of(context).size.width / 3.2 > 300
          ? 300
          : MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType,
      centerText: "80",
      legendOptions: LegendOptions(
        showLegends: _showLegends,
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValues: _showChartValues,
      ),
      ringStrokeWidth: _ringStrokeWidth,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Pie Chart"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30,right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              child: chart,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            progressBar(),
            Text("Enviroment"),
          ],
        ),
      ),
    );
  }
}
