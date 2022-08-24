import 'package:la_vie/modulrs/login/login_screen.dart';
import 'package:la_vie/shared/components/component.dart';
import 'package:la_vie/shared/network/local/cache_helper.dart';

String? accessToken;
void signOut(context) {
  CacheHelper.removeData(key: 'accessToken').then((value) {
    if (value) {
      navigatorAndRemove(context, LoginScreen());
    }
  });
}
