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
            Text('Task ID: ${auditData?.taskId}'),
            Text('Status: ${auditData?.status}'),
            SizedBox(height: 10),
            Text('Score: ${auditData?.results?['seo_score']}'),
            Text('Accuracy: ${auditData?.results?['accuracy']}'),
            Text('Efficiency: ${auditData?.results?['efficiency']}'),
            Text('Compliance: ${auditData?.results?['compliance']}'),
            Text('Pages: ${auditData?.results?['pages']}'),
            Text('Passed: ${auditData?.results != null ? "Yes" : "No"}'),
          ],
        ),
      ),
    );
  }
}
