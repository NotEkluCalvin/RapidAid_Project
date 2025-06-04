import 'package:latlong2/latlong.dart';

class ReportModel {
  final String id;
  final String imagePath;
  final String message;
  final List<ReportComments> comments;
  final DateTime createdAt;
  final LatLng? location;
  final String? address;

  ReportModel({
    required this.id,
    required this.imagePath,
    required this.message,
    this.comments = const [],
    DateTime? createdAt,
    this.location,
    this.address,
  }) : createdAt = createdAt ?? DateTime.now();

  ReportModel copyWith({
    List<ReportComments>? comments,
    DateTime? createdAt,
    LatLng? location,
    String? address,
  }) {
    return ReportModel(
      id: id,
      imagePath: imagePath,
      message: message,
      comments: comments ?? this.comments,
      createdAt: createdAt ?? this.createdAt,
      location: location ?? this.location,
      address: address ?? this.address,
    );
  }
}

class ReportComments {
  final String id;
  final String content;
  final DateTime createdAt;

  ReportComments({required this.id, required this.content, DateTime? createdAt})
    : createdAt = createdAt ?? DateTime.now();
}
