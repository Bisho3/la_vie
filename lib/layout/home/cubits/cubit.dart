import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/home/cubits/states.dart';
import 'package:la_vie/models/Update_profile/update_profile_model.dart';
import 'package:la_vie/models/blog/blogsmmodel.dart';
import 'package:la_vie/models/blog_search/blog_search_model.dart';
import 'package:la_vie/models/formus/formus_model.dart';
import 'package:la_vie/models/plants/plants_model.dart';
import 'package:la_vie/models/product/product_model.dart';
import 'package:la_vie/models/profile/profile_model.dart';
import 'package:la_vie/models/speeds/speeds_model.dart';
import 'package:la_vie/models/tools/tools_model.dart';
import 'package:la_vie/modulrs/formus/formusone_screen.dart';
import 'package:la_vie/modulrs/notification/notification_screen.dart';
import 'package:la_vie/modulrs/profile/profile_screen.dart';
import 'package:la_vie/modulrs/scan/scan_screen.dart';
import 'package:la_vie/modulrs/show_all_product/show_all_product.dart';
import 'package:la_vie/shared/components/constant.dart';
import 'package:la_vie/shared/network/end_points.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';

class LavieCubit extends Cubit<LavieStates> {
  LavieCubit() : super(LavieInitialStates());

  static LavieCubit get(context) => BlocProvider.of(context);

//ثابت =2
  int currentIndex = 2;
  List<Widget> screens = [
    FormusOneScreen(),
    ScanScreen(),
    TemplateScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(LavieChangeBottomNavigatorStates());
  }

  ProductModel? productModel;

  void getProductData() {
    emit(LavieLoadingHomeDataStates());
    DioHelper.getData(
      url: HOME,
      accessToken: accessToken,
    ).then((value) {
      productModel = ProductModel.fromJson(value.data);
      // print(productModel!.data);
      // print('${productModel!.message} Mahmoud');
      emit(LavieSuccessHomeDataStates());
    }).catchError((error) {
      // print(error.toString());
      emit(LavieErrorHomeDataStates(error.toString()));
    });
  }

  PlantsModel? plantsModel;

  void getPlantsData() {
    emit(LavieLoadingPlantsDataStates());
    DioHelper.getData(
      url: PLANTS,
      accessToken: accessToken,
    ).then((value) {
      plantsModel = PlantsModel.fromJson(value.data);
      // print(plantsModel!.data);
      // print('${plantsModel!.message} Bisho');
      emit(LavieSuccessPlantsDataStates());
    }).catchError((error) {
      // print(error.toString());
      emit(LavieErrorPlantsDataStates(error.toString()));
    });
  }

  SpeedsModel? speedsModel;

  void getSpeedsData() {
    emit(LavieLoadingSpeedsDataStates());
    DioHelper.getData(
      url: SPEEDS,
      accessToken: accessToken,
    ).then((value) {
      speedsModel = SpeedsModel.fromJson(value.data);
      // print(speedsModel!.data);
      // print('${speedsModel!.message} Bisho');
      emit(LavieSuccessSpeedsDataStates());
    }).catchError((error) {
      // print(error.toString());
      emit(LavieErrorSpeedsDataStates(error.toString()));
    });
  }

  ToolsModel? toolsModel;

  void getToolsData() {
    emit(LavieLoadingToolsDataStates());
    DioHelper.getData(
      url: TOOLS,
      accessToken: accessToken,
    ).then((value) {
      toolsModel = ToolsModel.fromJson(value.data);
      // print(toolsModel!.data);
      // print('${toolsModel!.message} Bisho');
      emit(LavieSuccessToolsDataStates());
    }).catchError((error) {
      // print(error.toString());
      emit(LavieErrorToolsDataStates(error.toString()));
    });
  }

  BlogsModel? blogsModel;

  void getBlogsData() {
    emit(LavieLoadingBlogsDataStates());
    DioHelper.getData(
      url: BLOGS,
      accessToken: accessToken,
    ).then((value) {
      blogsModel = BlogsModel.fromJson(value.data);
      // print(toolsModel!.data);
      // print('${toolsModel!.message} Bisho');
      emit(LavieSuccessBlogsDataStates());
    }).catchError((error) {
      // print(error.toString());
      emit(LavieErrorBlogsDataStates(error.toString()));
    });
  }

  BlogsSearchModel? blogsSearchModel;

  void getBlogsSearchData() {
    emit(LavieLoadingProfileUpdateStates());
    DioHelper.getData(
      url: BLOG_SEARCH,
      accessToken: accessToken,
    ).then((value) {
      blogsSearchModel = BlogsSearchModel.fromJson(value.data);
      // print(toolsModel!.data);
      // print('${toolsModel!.message} Bisho');
      emit(LavieSuccessBlogsSearchDataStates());
    }).catchError((error) {
      // print(error.toString());
      emit(LavieErrorBlogsSearchDataStates(error.toString()));
    });
  }

  ProfileModel? profileModel;

  void getUserData() {
    emit(LavieLoadingUserDataStates());

    DioHelper.getData(
      url: PROFILE,
      accessToken: accessToken,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      // print('here na user ${accessToken}');
      // print(profileModel!.data!.firstName);

      emit(LavieSuccessUserDataStates());
    }).catchError((error) {
      // print(error.toString());
      emit(LavieErrorUserDataStates(error.toString()));
    });
  }

  UpdateDataModel? updateDataModel;

  void putUserData({
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String address,
  }) {
    emit(LavieLoadingProfileUpdateStates());

    DioHelper.getData(url: UPTADATE_DATA, accessToken: accessToken, query: {
      'firstName': firstName,
      'lastName': lastName,
      'email': emailAddress,
      'address': address,
    }).then((value) {
      updateDataModel = UpdateDataModel.fromJson(value.data);
      // print('First Nammmme In Get ${updateDataModel!.data!.firstName}');

      emit(LavieSuccessProfileUpdateStates());
    }).catchError((error) {
      print(error.toString());
      emit(LavieErrorProfileUpdateStates(error.toString()));
    });
  }

  FormusModel? formusModel;

  void getFormus() {
    emit(LavieLoadingFormusStates());

    DioHelper.getData(
      url: FORMUS,
      accessToken: accessToken,
    ).then((value) {
      formusModel = FormusModel.fromJson(value.data);
      // print('here na user ${accessToken}');
      // print(profileModel!.data!.firstName);

      emit(LavieSuccessFormusStates());
    }).catchError((error) {
      // print(error.toString());
      emit(LavieErrorFormusStates(error.toString()));
    });
  }

  List<ProductModel> dataList = [];
// بص ده كدا و افهمه انت معايا ؟
  void search(String val) {
    List dataList = [];
    emit(LoadingSearch());
    DioHelper.getData(
      url: HOME,
      accessToken: accessToken,
    ).then((value) {
      print(value.data.toString());

      value.data['data'].forEach((i) {
        i['name'].toString().contains(val)
            ? dataList.add(ProductModel.fromJson(i))
            : null;
      });
      emit(SearchSuccess());
    }).catchError((error) {
      emit(SearchError(error.toString()));
    });
  }
}
