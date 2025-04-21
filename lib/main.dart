import 'package:flutter/material.dart';

import 'package:notify/screens/audit_dashboard.dart';

void main() => runApp(AloraApp());

class AloraApp extends StatelessWidget {
  const AloraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alora Site Auditor',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: AuditDashboard(),
    );
  }
}

