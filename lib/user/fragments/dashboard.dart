import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:attendance_app/user/fragments/profile_screen.dart';
import 'package:attendance_app/user/userPreferences/current_user.dart';

class DashboardSiswa extends StatelessWidget {
  final CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

  Future<bool> _onWillPop(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Konfirmasi'),
            content: Text('Apakah Anda ingin meninggalkan aplikasi?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Iya'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (CurrentUser) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return WillPopScope(
          onWillPop: () => _onWillPop(context),
          child: Scaffold(
            appBar: AppBar(
              title: Text("Dashboard"),
            ),
            body: Center(
              child: IconButton(
                icon: const Icon(Icons.people),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => ProfileScreen()));
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
