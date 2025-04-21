import 'dart:convert';
import 'package:http/http.dart' as http;

// class AuditResult {
//   final String taskId;
//   final String status;
//   final Map<String, dynamic>? results;
//
//   AuditResult({required this.taskId, required this.status, this.results});
//
//   factory AuditResult.fromJson(Map<String, dynamic> json) => AuditResult(
//         taskId: json['task_id'],
//         status: json['status'],
//         results: json['results'],
//       );
// }
class AuditResult {
  final String taskId;
  final String status;
  final Map<String, dynamic>? results;

  AuditResult({
    required this.taskId,
    required this.status,
    this.results,
  });

  factory AuditResult.fromJson(Map<String, dynamic> json) {
    return AuditResult(
      taskId: json['task_id'] as String,
      status: json['status'] as String,
      results: json['results'] != null
          ? Map<String, dynamic>.from(json['results'])
          : null,
    );
  }
}

class AuditService {
  final String baseUrl = 'https://audit.alorasite.com';

  Future<AuditResult> startAudit(String websiteUrl) async {
    final res = await http.post(
      Uri.parse('$baseUrl/audit'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'website_url': websiteUrl}),
    );
    return AuditResult.fromJson(jsonDecode(res.body));
  }

  Future<AuditResult> getAuditResult(String taskId) async {
    final res = await http.get(Uri.parse('$baseUrl/audit/$taskId'));
    return AuditResult.fromJson(jsonDecode(res.body));
  }

  Future<String> getAuditStatus(String taskId) async {
    final res = await http.get(Uri.parse('$baseUrl/audit/$taskId/status'));
    return jsonDecode(res.body)['status'];
  }
}
