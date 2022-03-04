class User {
  String name;
  int age;
  List<String>? professions = [];

  User({
    required this.name,
    required this.age,
    this.professions,
  });

  User copyWith({
      String? name,
      int? age,
      List<String>? professions,
  }) {
    return User(
      age: age ?? this.age, 
      name: name ?? this.name, 
      professions: professions ??  this.professions,);
  }
}
