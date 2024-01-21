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
  final String name;
  final String description;
  final String image;
  final String status;
  final String people_count;
  final List<Firebase> firebase;
  Data({
    required this.name,
    required this.description,
    required this.image,
    required this.status,
    required this.people_count,
    required this.firebase,
  });

  Data copyWith({
    String? name,
    String? description,
    String? image,
    String? status,
    String? people_count,
    List<Firebase>? firebase,
  }) {
    return Data(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      status: status ?? this.status,
      people_count: people_count ?? this.people_count,
      firebase: firebase ?? this.firebase,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'image': image});
    result.addAll({'status': status});
    result.addAll({'people_count': people_count});
    result.addAll({'firebase': firebase.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      status: map['status'] ?? '',
      people_count: map['people_count'] ?? '',
      firebase: List<Firebase>.from(map['firebase']?.map((x) => Firebase.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(name: $name, description: $description, image: $image, status: $status, people_count: $people_count, firebase: $firebase)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.status == status &&
      other.people_count == people_count &&
      listEquals(other.firebase, firebase);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      status.hashCode ^
      people_count.hashCode ^
      firebase.hashCode;
  }
}

class Firebase {
  final int id;
  final int room_id;
  final String name;
  final String link_monitoring;
  final String link_controlling;
  final String satuan;
  final String createdAt;
  final String updatedAt;
  Firebase({
    required this.id,
    required this.room_id,
    required this.name,
    required this.link_monitoring,
    required this.link_controlling,
    required this.satuan,
    required this.createdAt,
    required this.updatedAt,
  });

  Firebase copyWith({
    int? id,
    int? room_id,
    String? name,
    String? link_monitoring,
    String? link_controlling,
    String? satuan,
    String? createdAt,
    String? updatedAt,
  }) {
    return Firebase(
      id: id ?? this.id,
      room_id: room_id ?? this.room_id,
      name: name ?? this.name,
      link_monitoring: link_monitoring ?? this.link_monitoring,
      link_controlling: link_controlling ?? this.link_controlling,
      satuan: satuan ?? this.satuan,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'room_id': room_id});
    result.addAll({'name': name});
    result.addAll({'link_monitoring': link_monitoring});
    result.addAll({'link_controlling': link_controlling});
    result.addAll({'satuan': satuan});
    result.addAll({'createdAt': createdAt});
    result.addAll({'updatedAt': updatedAt});
  
    return result;
  }

  factory Firebase.fromMap(Map<String, dynamic> map) {
    return Firebase(
      id: map['id']?.toInt() ?? 0,
      room_id: map['room_id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      link_monitoring: map['link_monitoring'] ?? '',
      link_controlling: map['link_controlling'] ?? '',
      satuan: map['satuan'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Firebase.fromJson(String source) => Firebase.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Firebase(id: $id, room_id: $room_id, name: $name, link_monitoring: $link_monitoring, link_controlling: $link_controlling, satuan: $satuan, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Firebase &&
      other.id == id &&
      other.room_id == room_id &&
      other.name == name &&
      other.link_monitoring == link_monitoring &&
      other.link_controlling == link_controlling &&
      other.satuan == satuan &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      room_id.hashCode ^
      name.hashCode ^
      link_monitoring.hashCode ^
      link_controlling.hashCode ^
      satuan.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}