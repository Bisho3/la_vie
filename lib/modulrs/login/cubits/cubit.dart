import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/login/login_model.dart';
import 'package:la_vie/modulrs/login/cubits/states.dart';
import 'package:la_vie/shared/network/end_points.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialStates());

  static LoginCubit get(context) => BlocProvider.of(context);
  late LoginModel loginModel;
  void UserLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingStates());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessStates(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorStates(error.toString()));
    });
  }
}
