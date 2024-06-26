import "dart:convert";
import "package:get/get.dart";
import "package:attendance_app/api_connection/api_connection.dart";
import "package:attendance_app/user/model/user.dart";
import "package:attendance_app/user/userPreferences/user_preferences.dart";
import 'package:http/http.dart' as http;

class CurrentUser extends GetxController {
  Rx<Siswa> _currentUser = Siswa('', '', '', '', '', '', '').obs;

  Siswa get user => _currentUser.value;

  getUserInfo() async {
    Siswa? getUserInfoFromLocalStorage = await RememberUserPrefs.readUserInfo();
    _currentUser.value = getUserInfoFromLocalStorage!;
  }

  updateUserInfo(Siswa updatedUser) async {
    _currentUser.value = updatedUser;
    await RememberUserPrefs.storeUserInfo(updatedUser);
  }

  Future<void> syncUserInfo() async {
    try {
      var res = await http.get(Uri.parse('${API.getData}?nis=${_currentUser.value.nis}'));
      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.body);
        if (resBody['success'] == true) {
          Siswa updatedUser = Siswa.fromJson(resBody['userData']);
          updateUserInfo(updatedUser);
        }
      }
    } catch (error) {
      print("Error syncing user info: $error");
    }
  }

}
