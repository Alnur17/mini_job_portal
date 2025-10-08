import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mini_job_portal/app/modules/auth/login/views/login_view.dart';
import 'package:mini_job_portal/app/modules/dashboard/views/dashboard_view.dart';
import '../../../../../common/helper/local_store.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find(); // easy access anywhere

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginView());
    } else {
      Get.offAll(() =>  DashboardView());
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await LocalStorage.saveData(key: 'userEmail', data: email);
      Get.snackbar("Success", "Account created successfully!");
      // _setInitialScreen will auto navigate after signup
    } catch (e) {
      Get.snackbar("Signup Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await LocalStorage.saveData(key: 'userEmail', data: email);
      Get.snackbar("Welcome", "Login successful!");
      Get.offAll(() =>  DashboardView());
    } catch (e) {
      Get.snackbar("Login Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await LocalStorage.removeData(key: 'userEmail');
    Get.offAll(() => const LoginView());
  }

  String? get currentUserEmail => LocalStorage.getData(key: 'userEmail');
}
