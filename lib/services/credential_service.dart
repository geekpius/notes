
class CredentialService{

  static final CredentialService _credentialService = CredentialService._internal();
  factory CredentialService() => _credentialService;
  CredentialService._internal();

  final List<Map<String, dynamic>> _users = [
    {
      'username': 'geekjs',
      'password': 'password',
    },
    {
      'username': 'ken',
      'password': 'password',
    },
    {
      'username': 'gitjab',
      'password': 'password',
    }
  ];

  bool login(Map<String, dynamic> credentials) => _users.any((obj) => obj['username'] == credentials['username'] && obj['password'] == credentials['password']);

}