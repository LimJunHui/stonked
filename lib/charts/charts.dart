import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:path/path.dart';
// import 'package:http/http.dart' as http;

class StockChart extends StatelessWidget {
//   Future<http.Response> fetchAlbum() {
//   return http.get(Uri.parse('https://rapidapi.com'));
// }

  @override
  Widget build(BuildContext context) {
    double startDate;
    double endDate;
    List<FlSpot> stockA = [
      FlSpot(0, 25000),
      FlSpot(1, 25500),
      FlSpot(2, 25400),
      FlSpot(3, 25600),
      FlSpot(4, 25700),
      FlSpot(5, 25800)
    ];

    List<FlSpot> stockB = [
      FlSpot(0, 15000),
      FlSpot(1, 15500),
      FlSpot(2, 15400),
      FlSpot(3, 15600),
      FlSpot(4, 15700),
      FlSpot(5, 15800)
    ];

    List<FlSpot> stockC = [
      FlSpot(0, 26000),
      FlSpot(1, 26500),
      FlSpot(2, 26400),
      FlSpot(3, 26600),
      FlSpot(4, 26700),
      FlSpot(5, 26800)
    ];


    return Container(
      width: 300,
      height: 300,
      child: LineChart(
        LineChartData(
            minX: startDate,
            maxX: endDate,
            minY: startDate,
            maxY: endDate,
            lineBarsData: [LineChartBarData(spots: stockA),LineChartBarData(spots: stockB),LineChartBarData(spots: stockC)]),
      ),
    );
  }
}