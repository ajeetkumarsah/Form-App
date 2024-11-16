class User {
  final String id;
  final String name;
  final int age;
  final List<User> children;

  User({
    required this.id,
    required this.name,
    required this.age,
    this.children = const [],
  });

  User copyWith({
    String? id,
    String? name,
    int? age,
    List<User>? children,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      children: children ?? this.children,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, age: $age, children: $children)';
  }
}
