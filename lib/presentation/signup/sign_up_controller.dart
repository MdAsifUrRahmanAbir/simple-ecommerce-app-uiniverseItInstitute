import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerc/utils/logger.dart';

import '../../utils/password_validation.dart';

class SignUpController extends GetxController{
  final formKey = GlobalKey<FormState>();

  RxInt selectValue = 1.obs;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNameController = TextEditingController();
  final passNameController = TextEditingController();
  final confirmController = TextEditingController();

  RxBool isChacked = false.obs;



  void signUpAction() {
    if(formKey.currentState!.validate()){
      if(GetUtils.isEmail(emailController.text)){
        if(passwordRegex.hasMatch(passNameController.text) && passNameController.text == confirmController.text){
          emailController.text.greenConsole;
          passNameController.text.greenConsole;
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