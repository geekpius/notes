
import 'package:blog/extensions/widgets/align_extension.dart';
import 'package:blog/extensions/widgets/padding_extension.dart';
import 'package:blog/extensions/widgets/text_extension.dart';
import 'package:blog/utils/constants.dart';
import 'package:blog/view_models/user_view_model.dart';
import 'package:blog/widgets/common/vertical_space.dart';
import 'package:flutter/material.dart';

import '../services/git_it_service_locator.dart';
import '../utils/app_navigator_util.dart';
import '../widgets/forms/app_input_field.dart';
import '../widgets/forms/app_primary_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;


  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNoteBlack,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: kNoteBlack,
        centerTitle: false,
        leading: IconButton(
          onPressed: () => AppNavigatorUtil.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20.0,
            color: kPrimaryWhite,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Notie Login').semiBold().fontSize(16).color(kPrimaryWhite),
            const VerticalSpace(height: 32),
            Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppInputField(
                    customBorderColor: kGrey300,
                    textColor: kPrimaryWhite,
                    hintText: 'Username',
                    controller: usernameController,
                    validator: (value){
                      if(value!.isEmpty) return 'Title field is required';
                      return null;
                    },
                    autofillHints: const [AutofillHints.username],
                  ),
                  const VerticalSpace(height: 8),
                  AppInputField(
                    customBorderColor: kGrey300,
                    textColor: kPrimaryWhite,
                    hintText: 'Password',
                    controller: passwordController,
                    validator: (value){
                      if(value!.isEmpty) return 'Content field is required';
                      return null;
                    },
                    obscureText: true,
                    autofillHints: const [AutofillHints.password],
                  ),
                  const VerticalSpace(height: 8),
                  AppPrimaryButton(
                    onPressed: () async{
                      if(formKey.currentState!.validate()){
                        await sl.get<UserViewModel>().login(
                          context,
                          requestBody: {
                            'username': usernameController.text,
                            'password': passwordController.text,
                          }
                        );
                      }else{
                        setState(() => autovalidateMode = AutovalidateMode.onUserInteraction );
                      }
                    },
                    text: 'Sign In',
                    minWidth: double.infinity,
                    color: kPrimaryWhite,
                    textColor: kNoteBlack,
                  )
                ],
              ),
            ).paddingOnly(bottom: 48),
          ],
        ).paddingSymmetric(
          horizontal: 24.0,
        ).alignCenter(),
      ),
    );
  }
}
