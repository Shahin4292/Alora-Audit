import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SeverityPieChart extends StatelessWidget {
  final List<dynamic> nucleiFindings;

  const SeverityPieChart({super.key, required this.nucleiFindings});

  @override
  Widget build(BuildContext context) {
    final severityCounts = {'high': 0, 'medium': 0, 'low': 0, 'info': 0};

    for (var item in nucleiFindings) {
      final severity = (item['severity'] ?? 'info').toLowerCase();
      if (severityCounts.containsKey(severity)) {
        severityCounts[severity] = severityCounts[severity]! + 1;
      } else {
        severityCounts['info'] = severityCounts['info']! + 1;
      }
    }

    return Column(
      children: [
        Text("Vulnerability Severity", style: Theme.of(context).textTheme.titleLarge),
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sectionsSpace: 4,
              centerSpaceRadius: 40,
              sections: severityCounts.entries.map((entry) {
                final color = {
                  'high': Colors.red,
                  'medium': Colors.orange,
                  'low': Colors.yellow,
                  'info': Colors.blue
                }[entry.key]!;
                return PieChartSectionData(
                  value: entry.value.toDouble(),
                  title: '${entry.key} (${entry.value})',
                  color: color,
                  titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  radius: 60,
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
