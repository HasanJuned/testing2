import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing2/presentation/ui/screens/auth/login_screen.dart';

class AuthController {
  static String? accessToken;
  static String? email0, fullName0, number0, password0, address0, isPaid0;

  //static String? get accessToken => _accessToken;
  /// set user token
  static Future<void> setAccessToken(String token) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    accessToken = token;
  }

  static Future<void> setIsPaid(String isPaid) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.setString('isPaid', isPaid);
    isPaid0 = isPaid;
  }

  static Future<void> setProfileDetails(String fullName, String number,
      String address, String email, String password) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.setString('fullName', fullName);
    await sharedPreferences.setString('number', number);
    await sharedPreferences.setString('address', address);
    await sharedPreferences.setString('email', email);
    await sharedPreferences.setString('password', password);
    email0 = email;
    fullName0 = fullName;
    number0 = number;
    address0 = address;
    password0 = password;

  }

  /// get user token
  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString('token');
    fullName0 = sharedPreferences.getString('fullName');
    number0 = sharedPreferences.getString('number');
    address0 = sharedPreferences.getString('address');
    email0 = sharedPreferences.getString('email');
    password0 = sharedPreferences.getString('password');
    isPaid0 = sharedPreferences.getString('isPaid');
    print(accessToken);
    print(fullName0);
    print(number0);
    print(address0);
    print(email0);
    print(password0);
    print(isPaid0);
  }

  // static Future<void> getReadProfile() async {
  //   final SharedPreferences sharedPreferences =
  //   await SharedPreferences.getInstance();
  //   //_readProfile = sharedPreferences.getString('read_profile');
  //   print('tg $_readProfile');
  // }

  static Future<void> clearUserInfo() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.clear().then((value) => Get.offAll(const LoginScreen()));
  }

  /// user already logged in or not
  static bool isLoggedIn() {
    return accessToken != null;
  }
  static Future<bool> checkLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString('token');

    if (accessToken == null) {
      return false;
    } else {
      return true;
    }
  }

  // static Future<void> setThemeMode(String ans) async {
  //   final SharedPreferences sharedPreferences =
  //   await SharedPreferences.getInstance();
  //   await sharedPreferences.setString('theme_mode', ans);
  //   //themeMode = ans;
  // }

  // static Future<void> getTheme() async {
  //   final SharedPreferences sharedPreferences =
  //   await SharedPreferences.getInstance();
  //   //themeMode = sharedPreferences.getString('theme_mode');
  // }
}