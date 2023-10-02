import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerc/utils/logger.dart';

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
}