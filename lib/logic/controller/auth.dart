import 'package:ecommerce/model/facebook_auth.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'loggedin_controller.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isChecked = false;
  var googleSignIn = GoogleSignIn();
  var displayname = ''.obs;
  var displayPhoto = ''.obs;
  var displayEmail=''.obs;
  var auth = FirebaseAuth.instance;
  FacebookAuthModel? facebookModel;
  var test=false.obs;
  User ? get userProfile=>auth.currentUser;

  @override
  void onInit() {
    displayname.value=(userProfile !=null?userProfile?.displayName:'')!;
    displayPhoto.value=(userProfile !=null?userProfile?.photoURL:'')!;
    displayEmail.value=(userProfile !=null?userProfile?.email:'')!;
    super.onInit();
  }
  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isChecked = !isChecked;
    update();
  }

  void snackBar(
          {required String title,
          required String message,
          Color color = errorClr}) =>
      Get.snackbar(title, message,
          snackPosition: SnackPosition.TOP, backgroundColor: color);

  void signUpFirebase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayname.value = name;
        auth.currentUser?.updateDisplayName(name);
      });
      Get.offNamed(Routes.loginScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = 'Provided password is too weak';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account is already exists';
      }
      snackBar(title: title, message: message);
    } catch (error) {
      snackBar(title: 'Unexpected error', message: error.toString());
    }
  }

  void signInFirebase({required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayname.value = auth.currentUser!.displayName!);
      LoggedInController().changeRoute(true, true);
      snackBar(title: 'E Commerce', message: 'Hi ${displayname.value}',color: mainColor);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = error.code.toString();
      }
      snackBar(title: title, message: message);
    }
  }

  void ForgetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = error.code.toString();
      }
      snackBar(title: title, message: message);
    }
  }

  void signInUsingGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayname.value = googleUser!.displayName!;
      displayPhoto.value = googleUser.photoUrl!;
      GoogleSignInAuthentication googleSignInAuthentication=await googleUser.authentication;
      final AuthCredential credential=GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
      );
      await auth.signInWithCredential(credential);
      LoggedInController().changeRoute(true, true);
      snackBar(title: 'E Commerce', message: 'Welcome back ${displayname.value.split(' ')[0]}',color: mainColor);
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      snackBar(title: 'ERROR!', message: error.toString());
    }
  }

  void signInUsingFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      facebookModel = FacebookAuthModel.fromJson(data);
      LoggedInController().changeRoute(true, true);
      displayname.value=data['name'];
      snackBar(
          title: 'E Commerce',
          message: 'Logged in Successfully',
          color: mainColor);
      update();
      Get.offNamed(Routes.mainScreen);
    }
  }

  void signOut() async {
    try {
      snackBar(title: 'E Commerce', message: 'logged out successfully');
      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayPhoto.value = '';
      displayname.value = '';
      displayEmail.value='';
      LoggedInController().changeRoute(true,false);
      update();
      Get.offNamed(Routes.loginScreen);

    } catch (e) {
      snackBar(title: 'ERROR!', message: e.toString());
    }
  }
}
