import 'package:dna_ventures/app/models/user_model.dart';
import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths
import 'dart:io';
import 'dart:async';

class MemoDbProvider {
  final String userTable = 'UserTable';
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path, "user.db"); //create path to database

    return await openDatabase(
      //open the database or create a database if there isn't any
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          """CREATE TABLE $userTable(
          name TEXT,
          email TEXT,
          password TEXT,
          phone_number TEXT)""",
        );
      },
    );
  }

  Future<bool> registerUser(UserModel user) async {
    bool isUserRegistered = false;
    final db = await init(); //open database

    var similiarUserList = await db.rawQuery(
        "SELECT * FROM $userTable WHERE phone_number = '${user.phoneNumber}'");

    if (similiarUserList.isEmpty) {
      db.insert("$userTable", user.toJson());
      isUserRegistered = true;
    }

    return isUserRegistered;
  }

  Future<UserModel?> loginUser(String phoneNumber, String password) async {
    final db = await init();
    var foundUsersList = await db.rawQuery(
        "SELECT * FROM $userTable WHERE phone_number = '$phoneNumber' and password = '$password'");

    if (foundUsersList.length > 0) {
      return UserModel.fromJson(foundUsersList.first);
    }

    return null;
  }

  Future<List<UserModel>> getAllUsers() async {
    final db = await init();
    final foundUsersList = await db.query("$userTable");

    return List<UserModel>.generate(
      foundUsersList.length,
      (index) => UserModel.fromJson(foundUsersList[index]),
    );
  }
}
