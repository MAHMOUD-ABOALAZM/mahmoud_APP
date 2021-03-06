import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_frist_project/layout/shop_app/cubit/states.dart';
import 'package:my_frist_project/models/shop_app/categories_model.dart';
import 'package:my_frist_project/models/shop_app/change_favorites_model.dart';
import 'package:my_frist_project/models/shop_app/favorites_model.dart';
import 'package:my_frist_project/models/shop_app/home_model.dart';
import 'package:my_frist_project/models/shop_app/login_model.dart';
import 'package:my_frist_project/modules/shop_app/categories/cateorgis_screen.dart';
import 'package:my_frist_project/modules/shop_app/favorites/favorites_screen.dart';
import 'package:my_frist_project/modules/shop_app/products/products_screen.dart';
import 'package:my_frist_project/modules/shop_app/setting/setting_screen.dart';
import 'package:my_frist_project/shared/components/constants.dart';
import 'package:my_frist_project/shared/network/end_points.dart';
import 'package:my_frist_project/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];

  void changeBottoms(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel homeModel;
  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      // printFullText(homeModel.data.banners[0].image);
      // print(homeModel.status);

      homeModel.data.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      //print(favorites.toString());

      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  ChangeFavoritesModel changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId];
    emit(ShopChangeFavoritesState());

    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      //print(value.data);

      if (!changeFavoritesModel.status) {
        favorites[productId] = !favorites[productId];
      } else {
        getFavorites();
      }

      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel));
    }).catchError((error) {
      favorites[productId] = !favorites[productId];

      emit(ShopErrorChangeFavoritesState());
    });
  }

  FavoritesModel favoritesModel;

  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  ShopLoginModel userModel;

  void getUserData() {
    emit(ShopLoadingGetUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.formJson(value.data);
      // printFullText(userModel.data.name);

      emit(ShopSuccessGetUserDataState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetUserDataState());
    });
  }

  void updateUserData({
    @required String name,
    @required String email,
    @required String phone,
  })
  {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name' : name,
        'email' : email,
        'phone' : phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.formJson(value.data);
      // printFullText(userModel.data.name);

      emit(ShopSuccessUpdateUserState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }
}
