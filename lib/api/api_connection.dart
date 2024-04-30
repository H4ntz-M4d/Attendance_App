import 'package:mysql1/mysql1.dart';

final dbSetting = ConnectionSettings(
  host: '127.0.0.1',
  port: 3306,
  user: 'root',
  db: 'attendace_app',
  // password: '', //Comment If No Password Needed
);

Future<void> main() async {
  final conn = await MySqlConnection.connect(dbSetting);
  print('Server started on port: ${dbSetting.port}');

  // Perform database operations here

    var result = await conn.query("SELECT * FROM teacher_table");
   for (var row in result) {
      print('NIP: ${row['NIP']}, Tname: ${row['Tname']}, Place: ${row['Place']}, DateofBirth: ${row['DateofBirth']}, Address: ${row['Address']}, NoPhone: ${row['NoPhone']}');
    }

  await conn.close();
}