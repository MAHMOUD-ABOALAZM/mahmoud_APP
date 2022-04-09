import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_frist_project/layout/news_app/cubit/cubit.dart';
import 'package:my_frist_project/layout/news_app/news_layout.dart';
import 'package:my_frist_project/layout/shop_app/cubit/cubit.dart';
import 'package:my_frist_project/layout/shop_app/shop_layout.dart';
import 'package:my_frist_project/modules/attendance_app/splach_screen/splach_screen.dart';
import 'package:my_frist_project/modules/shop_app/login/shop_login_screen.dart';
import 'package:my_frist_project/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:my_frist_project/shared/bloc_observer.dart';
import 'package:my_frist_project/shared/components/constants.dart';
import 'package:my_frist_project/shared/cubit/cubit.dart';
import 'package:my_frist_project/shared/cubit/states.dart';
import 'package:my_frist_project/shared/network/local/cache_helper.dart';
import 'package:my_frist_project/shared/network/remote/dio_helper.dart';
import 'package:my_frist_project/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print(token);

  if (onBoarding != null) {
    if (token != null)
      widget = ShopLayout();
    else
      widget = ShopLoginScreen();
  } else {
    widget = OnBoardingScreen();
  }

  runApp(MyApp(
    //isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  // constructor
  // build
  //final bool isDark;
  final Widget startWidget;

  MyApp({
    // this.isDark,
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => AppCubit()
            ..changeAppMode(
                // fromShared: isDark,
                ),
        ),
        BlocProvider(
            create: (context) => ShopCubit()..getHomeData()..getCategories()..getFavorites()..getUserData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            //darkTheme: darkTheme,
            //themeMode:
            // AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
