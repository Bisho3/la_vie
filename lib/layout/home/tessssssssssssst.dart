// void search(String val) {
//   dataList = [];
//   emit(SearchLoadingState());
//   DioHelper.getData(
//       url: AllToken,
//       token: PreferenceUtils.getString(SharedKeys.apiToken))
//       .then((value) {
//     value.data['data'].forEach((i) {
//       i['name'].toString().contains(val)
//           ? dataList.add(Datum.fromJson(i))
//           : null;
//     });
//     emit(SearchSuccessState());
//   }).catchError((onError) {
//     emit(SearchErrorState());
//   });
