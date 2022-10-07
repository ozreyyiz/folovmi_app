import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folovmi_app/view/auth/login/model/riverpod/login_riverpod.dart';
import 'package:folovmi_app/view/auth/register/riverpod/sign_up_riverpod.dart';

final loginRiverpod = ChangeNotifierProvider((_) => LoginRiverpod());
final signUpRiverpod = ChangeNotifierProvider((_) => SignUpRiverpod());
