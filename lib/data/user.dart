class User {
  final String id;
  final String name;
  final String surname;
  final String group;

  User({
    this.id = '1',
    required this.group,
    required this.name,
    required this.surname,
  });
}
