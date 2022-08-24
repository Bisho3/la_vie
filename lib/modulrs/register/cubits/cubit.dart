import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/register/register_model.dart';
import 'package:la_vie/modulrs/register/cubits/states.dart';
import 'package:la_vie/shared/network/end_points.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  late RegisterModel registerModel;

  void UserRegister({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'firstName': firstname,
        'lastName': lastname,
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      registerModel = RegisterModel.fromJson(value.data);
      emit(RegisterSuccessState(registerModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
}
