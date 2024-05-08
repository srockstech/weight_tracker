class User {
  String? _userName;

  User({required String? userName}) : _userName = userName;

  User.fromJson(Map<String, dynamic> json) {
    _userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = _userName;
    return data;
  }
}
