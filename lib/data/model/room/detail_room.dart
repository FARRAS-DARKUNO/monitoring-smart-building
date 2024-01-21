import 'dart:convert';

import 'package:flutter/foundation.dart';

class DetailRoomModel {
  final int status;
  final String message;
  final Data data;
  DetailRoomModel({
    required this.status,
    required this.message,
    required this.data,
  });

  DetailRoomModel copyWith({
    int? status,
    String? message,
    Data? data,
  }) {
    return DetailRoomModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'status': status});
    result.addAll({'message': message});
    result.addAll({'data': data.toMap()});
  
    return result;
  }

  factory DetailRoomModel.fromMap(Map<String, dynamic> map) {
    return DetailRoomModel(
      status: map['status']?.toInt() ?? 0,
      message: map['message'] ?? '',
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailRoomModel.fromJson(String source) => DetailRoomModel.fromMap(json.decode(source));

  @override
  String toString() => 'DetailRoomModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DetailRoomModel &&
      other.status == status &&
      other.message == message &&
      other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class Data {
  final String id;
  final String name;
  final String description;
  final String images;
  final String status;
  final int people_count;
  final List<Firebase> firebase;
  final String createdAt;
  final String updatedAt;
  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.status,
    required this.people_count,
    required this.firebase,
    required this.createdAt,
    required this.updatedAt,
  });

  Data copyWith({
    String? id,
    String? name,
    String? description,
    String? images,
    String? status,
    int? people_count,
    List<Firebase>? firebase,
    String? createdAt,
    String? updatedAt,
  }) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      status: status ?? this.status,
      people_count: people_count ?? this.people_count,
      firebase: firebase ?? this.firebase,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'images': images});
    result.addAll({'status': status});
    result.addAll({'people_count': people_count});
    result.addAll({'firebase': firebase.map((x) => x.toMap()).toList()});
    result.addAll({'createdAt': createdAt});
    result.addAll({'updatedAt': updatedAt});
  
    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      images: map['images'] ?? '',
      status: map['status'] ?? '',
      people_count: map['people_count']?.toInt() ?? 0,
      firebase: List<Firebase>.from(map['firebase']?.map((x) => Firebase.fromMap(x))),
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, name: $name, description: $description, images: $images, status: $status, people_count: $people_count, firebase: $firebase, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.images == images &&
      other.status == status &&
      other.people_count == people_count &&
      listEquals(other.firebase, firebase) &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      images.hashCode ^
      status.hashCode ^
      people_count.hashCode ^
      firebase.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}

class Firebase {
  final String name;
  final String link_monitoring;
  final String link_controlling;
  final String satuan;
  Firebase({
    required this.name,
    required this.link_monitoring,
    required this.link_controlling,
    required this.satuan,
  });

  Firebase copyWith({
    String? name,
    String? link_monitoring,
    String? link_controlling,
    String? satuan,
  }) {
    return Firebase(
      name: name ?? this.name,
      link_monitoring: link_monitoring ?? this.link_monitoring,
      link_controlling: link_controlling ?? this.link_controlling,
      satuan: satuan ?? this.satuan,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'link_monitoring': link_monitoring});
    result.addAll({'link_controlling': link_controlling});
    result.addAll({'satuan': satuan});
  
    return result;
  }

  factory Firebase.fromMap(Map<String, dynamic> map) {
    return Firebase(
      name: map['name'] ?? '',
      link_monitoring: map['link_monitoring'] ?? '',
      link_controlling: map['link_controlling'] ?? '',
      satuan: map['satuan'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Firebase.fromJson(String source) => Firebase.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Firebase(name: $name, link_monitoring: $link_monitoring, link_controlling: $link_controlling, satuan: $satuan)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Firebase &&
      other.name == name &&
      other.link_monitoring == link_monitoring &&
      other.link_controlling == link_controlling &&
      other.satuan == satuan;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      link_monitoring.hashCode ^
      link_controlling.hashCode ^
      satuan.hashCode;
  }
}