class User {
  final String username;
  final String email;
  final String password;

  User({
    required this.username,
    required this.email,
    required this.password
  });

  @override
  String toString(){
    return 'User --> Email: $email | Password: $password';
  }
}