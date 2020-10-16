class User {
  final String id;
  final String fullName;
  final String email;
  final String type;

  User({this.id, this.fullName, this.email, this.type});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        type = data['type'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'type': type,
    };
  }
}
