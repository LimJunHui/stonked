import 'package:flutter/material.dart';
import 'charts/charts.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stocks Charts'),
        ),
        body: Center(
            child: Container(
          height: 300,
          width: 300,
          child: StockChart(),
        )));
  }
}
