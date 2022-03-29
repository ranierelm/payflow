import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../shared/auth/auth_controller.dart';

class LoginController {
  final authControler = AuthController();

  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();

      authControler.setUser(context, response);

      print(response);
    } catch (error) {
      authControler.setUser(context, null);
      print(error);
    }
  }
}