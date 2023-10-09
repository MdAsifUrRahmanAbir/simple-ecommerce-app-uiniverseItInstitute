import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerc/utils/logger.dart';

import '../../backend/services/firebase_service.dart';
import '../../routes/routes.dart';
import '../../utils/app_config.dart';

class LoginController extends GetxController{
  final emailController = TextEditingController();
  final passController = TextEditingController();
  RxInt selectValue = 1.obs;
  RxBool isChecked = false.obs;

  final formKey = GlobalKey<FormState>();

  void loginAction() {
    if(formKey.currentState!.validate()){
      if(GetUtils.isEmail(emailController.text)){
        if(passwordRegex.hasMatch(passController.text)){
          emailController.text.greenConsole;
          passController.text.greenConsole;
          loginProcess();
        }
        else{
          Get.snackbar("Invalid Password", "Your password is not valid syntax");
        }

        /// todo login method
      }
      else{
        Get.snackbar("Invalid Email", "Your Email is not Valid");
      }
    }
  }
  // For google Password SignIn method
  void loginProcess() async{

    try{
      final UserCredential userCredential = await FirebaseServices.signInWithEmailAndPassword(
          email: emailController.text,
          password: passController.text
      );
      debugPrint("-------signInWithGoogle  =>  1  --------");

      // if(userCredential.user!.emailVerified){
        final user = userCredential.user!;

        debugPrint(user.email);
        debugPrint(user.displayName);
        debugPrint(user.photoURL);
        debugPrint(user.uid);
        debugPrint("Valid User");

        Get.snackbar("Login Successfully", "You are ready to go");
        Get.offAllNamed(Routes.homeScreen);
      // }else{
      //   debugPrint("Invalid User");
      // }
    }catch(e){
      e.toString().redConsole;
    }

  }

}