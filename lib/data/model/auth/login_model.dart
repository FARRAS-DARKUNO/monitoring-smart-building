import 'dart:convert';

class LoginModel {
  final int status;
  final String message;
  final Login data;
  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  LoginModel copyWith({
    int? status,
    String? message,
    Login? data,
  }) {
    return LoginModel(
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

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      status: map['status']?.toInt() ?? 0,
      message: map['message'] ?? '',
      data: Login.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginModel &&
      other.status == status &&
      other.message == message &&
      other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class Login {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String token;
  Login({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.token,
  });

  Login copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? token,
  }) {
    return Login(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'email': email});
    result.addAll({'token': token});
  
    return result;
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      id: map['id']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(id: $id, firstName: $firstName, lastName: $lastName, email: $email, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Login &&
      other.id == id &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      token.hashCode;
  }
}