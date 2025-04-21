import 'package:flutter/material.dart';

import '../services/audit_service.dart';

class AuditReportWebView extends StatelessWidget {
  AuditResult? auditData;
  AuditReportWebView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audit Report')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Task ID: ${auditData?.taskId ?? 12345}'),
            Text('Status: ${auditData?.status ?? 'Completed'}'),
            SizedBox(height: 10),
            Text('Score: ${auditData?.results?['score'] ?? 60}'),
            Text('Accuracy: ${auditData?.results?['accuracy'] ?? 80}'),
            Text('Efficiency: ${auditData?.results?['efficiency'] ?? 65}'),
            Text('Compliance: ${auditData?.results?['compliance'] ?? 50}'),
            Text('Pages: ${auditData?.results?['pages'] ?? 10}'),
            // Text('Passed: ${auditData?.results != null ? "Yes" : "No"}'),
          ],
        ),
      ),
    );
  }
}
