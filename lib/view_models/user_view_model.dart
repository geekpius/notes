
import 'package:blog/extensions/widgets/text_extension.dart';
import 'package:blog/models/user_model.dart';
import 'package:blog/services/credential_service.dart';
import 'package:blog/utils/app_dialog_util.dart';
import 'package:blog/utils/app_navigator_util.dart';
import 'package:flutter/material.dart';
import '../services/git_it_service_locator.dart';
import '../services/local_storage_service.dart';

class UserViewModel extends ChangeNotifier{
  UserModel _userModel = UserModel(username: '', password: '', loggedIn: false, );

  Future<void> login(BuildContext context, {required Map<String, dynamic> requestBody}) async{
    AppDialogUtil.loadingDialog(context);
    await Future.delayed(const Duration(seconds: 2));
    if(context.mounted){
      AppNavigatorUtil.pop(context);
      if(CredentialService().login(requestBody)){
        _userModel = UserModel.fromJson({
          'username': requestBody['username'],
          'password': requestBody['password'],
          'loggedIn':true,
        });
        notifyListeners();
        storeToLocal();
        AppNavigatorUtil.pushReplacementNamed(context, AppRoute.homeView);
      }else{
        showAdaptiveDialog(
          context: context,
          builder: (context) => AlertDialog.adaptive(
            title: const Text('Credentials').semiBold().fontSize(16),
            content: const Text('Incorrect username or password').regular().fontSize(14.0),
          ),
        );
        return;
      }
    }

  }

  Future<void> logout(BuildContext context) async{
    AppDialogUtil.loadingDialog(context);
    await Future.delayed(const Duration(seconds: 2));
    if(context.mounted){
      AppNavigatorUtil.pop(context);
      await sl.get<LocalStorageService>().delete('userModel');
      _userModel = UserModel(username: '', password: '', loggedIn: false, );
      notifyListeners();
    }

  }

  bool get isLoggedIn => _userModel.loggedIn;
  String get getUsername => _userModel.username;
  bool forLoggedInUser(String noteUser) => _userModel.loggedIn && noteUser == _userModel.username;


  void storeToLocal() async{
    await sl.get<LocalStorageService>().encodeAndWrite('userModel', _userModel.toJson());
  }
  void getFromLocal() async{
    Map<String, dynamic> authUserData = await sl.get<LocalStorageService>().decodeAndReadMap('userModel');
    _userModel = UserModel.fromJson(authUserData);
  }

}