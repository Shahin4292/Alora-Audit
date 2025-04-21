import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AuditCharts extends StatelessWidget {
  final Map<String, dynamic> seo;
  final Map<String, dynamic> links;

  const AuditCharts({super.key, required this.seo, required this.links});

  @override
  Widget build(BuildContext context) {
    final brokenCount = (links['broken']?.length ?? 0).toDouble();
    final totalChecked = (links['total_checked'] ?? 0).toDouble();
    final validCount = totalChecked - brokenCount;

    return Column(
      children: [
        Text("SEO Score", style: Theme.of(context).textTheme.titleLarge),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              barGroups: [
                BarChartGroupData(x: 0, barRods: [
                  BarChartRodData(
                    toY: (seo['score'] ?? 0).toDouble(),
                    width: 20,
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  )
                ])
              ],
              titlesData: FlTitlesData(show: true),
              gridData: FlGridData(show: true),
              borderData: FlBorderData(show: false),
              maxY: 100,
            ),
          ),
        ),
        SizedBox(height: 24),
        Text("Link Health", style: Theme.of(context).textTheme.titleLarge),
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(sections: [
              PieChartSectionData(value: brokenCount, title: 'Broken', color: Colors.red, radius: 50),
              PieChartSectionData(value: validCount, title: 'Valid', color: Colors.blue, radius: 50),
            ]),
          ),
        ),
      ],
    );
  }
}
