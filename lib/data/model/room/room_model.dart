import 'dart:convert';

import 'package:flutter/foundation.dart';

class RoomModel {
  final int status;
  final String message;
  final List<Data> data;
  RoomModel({
    required this.status,
    required this.message,
    required this.data,
  });

  RoomModel copyWith({
    int? status,
    String? message,
    List<Data>? data,
  }) {
    return RoomModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'status': status});
    result.addAll({'message': message});
    result.addAll({'data': data.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      status: map['status']?.toInt() ?? 0,
      message: map['message'] ?? '',
      data: List<Data>.from(map['data']?.map((x) => Data.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModel.fromJson(String source) => RoomModel.fromMap(json.decode(source));

  @override
  String toString() => 'RoomModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RoomModel &&
      other.status == status &&
      other.message == message &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class Data {
  final int id;
  final String name;
  final String description;
  final String image;
  final String status;
  final String people_count;
  final String createdAt;
  final String updatedAt;
  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.status,
    required this.people_count,
    required this.createdAt,
    required this.updatedAt,
  });

  Data copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    String? status,
    String? people_count,
    String? createdAt,
    String? updatedAt,
  }) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      status: status ?? this.status,
      people_count: people_count ?? this.people_count,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'image': image});
    result.addAll({'status': status});
    result.addAll({'people_count': people_count});
    result.addAll({'createdAt': createdAt});
    result.addAll({'updatedAt': updatedAt});
  
    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      status: map['status'] ?? '',
      people_count: map['people_count'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, name: $name, description: $description, image: $image, status: $status, people_count: $people_count, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.status == status &&
      other.people_count == people_count &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      status.hashCode ^
      people_count.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}