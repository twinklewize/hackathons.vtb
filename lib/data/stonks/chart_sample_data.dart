// данные по ценам каждой акции за 1 день
class ChartSampleData {
  ChartSampleData({
    required this.x,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  DateTime x;
  double open;
  double high;
  double low;
  double close;
}
