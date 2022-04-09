//  https://newsapi.org/v2/everything?q=tesla&apiKey=642dc204dcda4702ab168a4278f46462

import 'package:my_frist_project/modules/shop_app/login/shop_login_screen.dart';
import 'package:my_frist_project/shared/components/components.dart';
import 'package:my_frist_project/shared/network/local/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, ShopLoginScreen(),
      );
    }
  });
}


void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


String token= '';
