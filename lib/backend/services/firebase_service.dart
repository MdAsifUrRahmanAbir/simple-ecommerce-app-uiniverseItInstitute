import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:simple_ecommerc/utils/logger.dart';

import '../../common_widget/toast_message.dart';
import '../../routes/routes.dart';
import '../models/banners_model.dart';
import '../models/popular_product_model.dart';


class FirebaseServices {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static User get user => _auth.currentUser!;

  static const String customerUserInfo = "customerUserInfo";
  static const String sellerInfo = "sellerInfo";
  static const String banners = "banners";
  static const String popularProducts = "popularProducts";


  /// auth
  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // await user.sendEmailVerification();
      // await user.reload();

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        "The password provided is too weak.".bgRedConsole;
        ToastMessage.error("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        'The account already exists for that email.'.bgRedConsole;
        ToastMessage.error('The account already exists for that email.');
      }
      throw UnimplementedError();
    } catch (e) {
      e.toString().redConsole;
      ToastMessage.error(e.toString());
      throw UnimplementedError();
    }
  }

  static Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential;
    } on FirebaseAuthException catch (e) {
      e.code.yellowConsole;
      if (e.code == 'user-not-found') {
        "No user found for that email.".bgRedConsole;
        ToastMessage.error("No user found for that email.");
      }else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        "No user found for that email.".bgRedConsole;
        ToastMessage.error("INVALID LOGIN CREDENTIALS");
      }else if (e.code == 'wrong-password') {
        'Wrong password provided for that user.'.bgRedConsole;
        ToastMessage.error('Wrong password provided for that user.');
      }
      throw UnimplementedError();
    } catch (e) {
      e.toString().redConsole;
      throw UnimplementedError();
    }
  }

  static Future<void> resetPassword(
      {required String email}) async{
    try {
      await _auth.sendPasswordResetEmail(email: email);
      "sendPasswordResetEmail to $email".greenConsole;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        "No user found for that email.".bgRedConsole;
        ToastMessage.error("No user found for that email.");
      }
      throw UnimplementedError();
    } catch (e) {
      e.toString().redConsole;
      throw UnimplementedError();
    }
  }

  static void logOutUser({bool toast = true}) async {
    try {
      await _auth.signOut();

      "Log Out Complete".bgGreenConsole;
      /// todo local storage removed value
      // LocalStorage.logout();
      // AppData.logOut();

      if (toast) {
        ToastMessage.success("Logout User");
        Get.offAllNamed(Routes.loginScreen);
      }
    } catch (e) {
      e.toString().redConsole;
    }
  }


  /// database
  static setData(Map<String, dynamic> userData, bool isAdmin) async {
    // isAdmin  if true = admin or customer

    // await _fireStore.collection(isAdmin ? customerUserInfo : sellerInfo).doc(user.uid).set(userData);
  }

  static checkData(Map<String, dynamic> userData, bool isUser) async {
    /// check free or premium

    final DocumentSnapshot userDoc =
    await _fireStore.collection(isUser ? customerUserInfo : sellerInfo).doc(user.uid).get();

    if (userDoc.exists) {

      // Get.offAllNamed(Routes.bottomNavScreen);
    }  else {
      setData(userData, isUser);
    }
  }

  static Future<List<BannerModel>?> fetchBanner()async{
    try{
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _fireStore.collection(banners).get();

      List<BannerModel> bannerList = snapshot.docs.map((doc) {
        final data = doc.data();
        return BannerModel.fromJson(data);
      }).toList();

      return bannerList;
    }catch(e){
      "Error From fetch banner in firebase services".bgRedConsole;
      e.toString().redConsole;
      return null;
    }
  }

  static Future<List<PopularProductModel>?> fetchPopularProduct()async{
    try{
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _fireStore.collection(popularProducts).get();

      List<PopularProductModel> bannerList = snapshot.docs.map((doc) {
        final data = doc.data();
        return PopularProductModel.fromJson(data);
      }).toList();


      return bannerList;
    }catch(e){
      "Error From fetch banner in firebase services".bgRedConsole;
      e.toString().redConsole;
      return null;
    }
  }

}