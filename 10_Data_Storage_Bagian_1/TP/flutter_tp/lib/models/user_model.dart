class User {
  final int? id;
  final String name;
  final String email;
  final DateTime? createdAt;

  User({this.id, required this.name, required this.email, this.createdAt});

  // Konversi dari Map ke User
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
    );
  }

  // Konversi dari User ke Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}
