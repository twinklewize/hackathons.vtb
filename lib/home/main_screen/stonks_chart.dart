import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vtb_hackathon/data/companies/companies.dart';
import 'package:vtb_hackathon/data/stonks/chart_sample_data.dart';

// ignore: must_be_immutable
class StonksChart extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  StonksChart(this.companyName);

  String companyName;

  @override
  _StonksChartState createState() => _StonksChartState();
}

class _StonksChartState extends State<StonksChart> {
  late TrackballBehavior _trackballBehavior;

  @override
  Widget build(BuildContext context) {
    List<ChartSampleData> data = Provider.of<Companies>(context)
        .companies
        .firstWhere((company) => company.name == widget.companyName)
        .stonksData;
    DateTime minDate = data[0].x;
    DateTime maxDate = data.last.x;
    return _buildHiloOpenClose(data, minDate, maxDate);
  }

  ///Get the cartesian chart with hilo open close series
  SfCartesianChart _buildHiloOpenClose(
    List<ChartSampleData> data,
    DateTime minDate,
    DateTime maxDate,
  ) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: '${minDate.month}'
              '.'
              '${minDate.year}'
              ' - '
              '${maxDate.month}'
              '.'
              '${maxDate.year}'),
      primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat.MMM(),
          interval: 3,
          intervalType: DateTimeIntervalType.months,
          minimum: minDate,
          maximum: maxDate,
          majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          minimum: data[0].low > data.last.low
              ? data.last.low - data.last.low * 0.25
              : data[0].low - data[0].low * 0.25,
          maximum: data[0].high > data.last.high
              ? data[0].high + data[0].high * 0.25
              : data.last.high + data.last.high * 0.25,
          interval: (data[0].high > data.last.high
                  ? data[0].high + data[0].high * 0.25
                  : data.last.high + data.last.high * 0.25) /
              8,
          labelFormat: r'$ {value}',
          axisLine: const AxisLine(width: 0)),
      series: _getHiloOpenCloseSeries(data),
      trackballBehavior: _trackballBehavior,
    );
  }

  ///Get the hilo open close series
  List<HiloOpenCloseSeries<ChartSampleData, DateTime>> _getHiloOpenCloseSeries(
      List<ChartSampleData> data) {
    return <HiloOpenCloseSeries<ChartSampleData, DateTime>>[
      HiloOpenCloseSeries<ChartSampleData, DateTime>(
          dataSource: data,
          name: 'AAPL',
          showIndicationForSameValues: true,
          xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,

          /// High, low, open and close values used to render the HLOC series.
          lowValueMapper: (ChartSampleData sales, _) => sales.low,
          highValueMapper: (ChartSampleData sales, _) => sales.high,
          openValueMapper: (ChartSampleData sales, _) => sales.open,
          closeValueMapper: (ChartSampleData sales, _) => sales.close)
    ];
  }

  @override
  void initState() {
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }
}
