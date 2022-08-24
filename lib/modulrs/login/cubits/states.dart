import 'package:la_vie/models/login/login_model.dart';

abstract class LoginStates {}

class LoginInitialStates extends LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {
  final LoginModel loginModel;

  LoginSuccessStates(this.loginModel);
}

class LoginErrorStates extends LoginStates {
  final String error;

  LoginErrorStates(this.error);
}

class LoginGoogleSuccessStates extends LoginStates {}

class LoginGoogleErrorStates extends LoginStates {
  final String error;

  LoginGoogleErrorStates(this.error);
}

class LoginFacebbokSuccessStates extends LoginStates {}

class LoginFacebookErrorStates extends LoginStates {
  final String error;

  LoginFacebookErrorStates(this.error);
}
