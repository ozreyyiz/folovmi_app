import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folovmi_app/view/auth/login/riverpod/login_riverpod.dart';

final loginRiverpod = ChangeNotifierProvider((_) => LoginRiverpod());
