import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:folovmi_app/view/auth/login/service/loginService.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../home/main_page/view/home_page.dart';

class LoginRiverpod extends ChangeNotifier {
  final service = LoginService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final box=GetStorage();

  void fetch(BuildContext context) {
    print(email.text);
   
    Center(
      child: CircularProgressIndicator(),
    );
    service.loginCall(email: email.text, password: password.text,context: context).then((value) {
      
      if (value != null) {
 
   log("kaydedilen token => ${box.read("token")}");
    
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Kullanıcı adı veya şifre yanlış.")));
      }
    });
  }
}
