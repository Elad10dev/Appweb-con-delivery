import 'dart:convert';

// Funciones para convertir un User desde y hacia JSON
User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

// Clase `User`
class User {
  String? id;
  String name;
  String lastname;
  String email;
  String phone;
  String password;
  String? sessionToken;
  String? image;
  List<Rol> roles; // Lista de roles

  User({
    this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.password,
    this.sessionToken,
    this.image,
    this.roles = const [], // Inicializamos la lista con un valor predeterminado
  });

  // Crear un objeto `User` desde JSON
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"] ?? '',
        lastname: json["lastname"] ?? '',
        email: json["email"] ?? '',
        phone: json["phone"] ?? '',
        password: json["password"] ?? '',
        sessionToken: json["session_token"],
        image: json["image"],
        roles: json["roles"] != null
            ? List<Rol>.from(json["roles"].map((role) => Rol.fromJson(role)))
            : [], // Convertimos roles o asignamos una lista vacía
      );

  // Convertir un objeto `User` a JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "password": password,
        "session_token": sessionToken,
        "image": image,
        "roles": roles.map((role) => role.toJson()).toList(), // Convertimos roles a JSON
      };
}

// Clase `Rol` para representar cada rol del usuario
class Rol {
  int id;
  String name;
  String? image;
  String route;

  Rol({
    required this.id,
    required this.name,
    this.image,
    required this.route,
  });

  // Crear un objeto `Rol` desde JSON
  factory Rol.fromJson(Map<String, dynamic> json) => Rol(
        id: json["id"],
        name: json["name"] ?? '',
        image: json["image"],
        route: json["route"] ?? '',
      );

  // Convertir un objeto `Rol` a JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "route": route,
      };
}
