import 'package:flutter/material.dart';
import '../utils/app_navigator_util.dart';
import '../utils/constants.dart';
import '../widgets/common/app_lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const Scaffold(
        backgroundColor: kNoteBlack,
        body: Center(
          child: AppLottie(
            fileName: 'splash.json',
            repeat: false,
          ),
        ),
      ),
    );
  }

  void navigate() async{
    await Future.delayed(const Duration(seconds: 5));
    if(!mounted) return;
    // final userProvider = context.read<UserViewModel>();
    // if(await userProvider.isLoggedIn()){
    //   if(!mounted) return;
      AppNavigatorUtil.pushReplacementNamed(context, AppRoute.homeView);
    //   return;
    // }
  }
}
