import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class LocalAuthenticationService {
  final _auth = LocalAuthentication();
  bool _isProtectionEnabled = false;

  bool get isProtectionEnabled => _isProtectionEnabled;
  set isProtectionEnabled(bool enabled) => _isProtectionEnabled = enabled;

  bool isAuthenticated = false;

  Future<void> authenticate() async {
    if (_isProtectionEnabled) {
      try {
        isAuthenticated = await _auth.authenticate(
          localizedReason: 'authenticate to access',
        );
      } on PlatformException catch (e) {
        print(e);
      }
    }
  }
}
