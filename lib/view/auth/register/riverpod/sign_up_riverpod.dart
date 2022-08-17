import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folovmi_app/view/auth/register/service/sign_up_service.dart';

class SignUpRiverpod extends ChangeNotifier {
  final service = SignUpService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void fetch(BuildContext context) {
    Center(
      child: CircularProgressIndicator(),
    );

    service.signUpCall(
      name: "User",
      lastName: "",
      gender: "M",
      birthDate: "1900-01-01",
      weight: 75,
      height: 180,
      identityNumber: "11111111111",
      phoneNumber: "+905555555555",
      email: email.text,
      hashPass: password.text,
      context: context,
    ).then((value) {
      if (value!=null) {
        print("successful");
      } else {
        print("unsuccessful");
        
      }
    });
  }
}
