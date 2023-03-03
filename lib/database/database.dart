import 'dart:io';
import 'package:final_matrimony/Models/city_model.dart';
import 'package:final_matrimony/Models/gender_model.dart';
import 'package:final_matrimony/Models/user_list_model.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'Matrimony_Finaldata.db');
    return await openDatabase(
      databasePath,
      version: 2,
    );
  }

  Future<void> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Matrimony_Finaldata.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle
          .load(join('assets/database', 'Matrimony_Finaldata.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
  }

  Future<List<GenderModel>> getGenderDetail() async {
    List<GenderModel> genderList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data = await db.rawQuery('SELECT * FROM Gender');
    GenderModel model =
    GenderModel(GenderID1: -1, GenderType1: 'Select Gender');

    genderList.add(model);
    for (int i = 0; i < data.length; i++) {
      model = GenderModel(
        GenderID1: data[i]['GenderID'] as int,
        GenderType1: data[i]['GenderType'].toString(),
      );

      genderList.add(model);
    }
    print("Gender LIST ::: ${genderList.length}");
    return genderList;
  }

  Future<List<CityModel>> getCityListFromTbl() async {
    List<CityModel> cityList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
    await db.rawQuery('SELECT * FROM mst_City');
    CityModel model = CityModel(CityID1: -1, CityName1: 'Select City');

    cityList.add(model);
    for (int i = 0; i < data.length; i++) {
      model = CityModel(
        CityID1: data[i]['CityID'] as int,
        CityName1: data[i]['CityName'].toString(),
      );

      cityList.add(model);
    }
    print("USER LIST ::: ${cityList.length}");
    return cityList;
  }



  Future<int> deleteUserFromUserTable(userID) async {
    Database db = await initDatabase();
    int deletedid = await db.delete(
      'userList',
      where: 'UserID = ?',
      whereArgs: [userID],
    );
    print('DELETEID:::::::::${deletedid}');
    return userID;
  }

  Future<void> favouriteUserFromUserTable(UserId, isFavourite) async {
    Database db = await initDatabase();
    Map<String, Object?> map = Map();

    map['isFavourite'] = isFavourite;

    if (UserId != -1) {
      print('CALLING:::::UPDATE::::::');
      await db
          .update('userList', map, where: 'UserID = ?', whereArgs: [UserId]);
    }
  }

  Future<void> upsertIntoUserTable(
      {UserId, UserName, dob, CityName, PhoneNo, Gender, isFavourite}) async {
    Database db = await initDatabase();
    Map<String, Object?> map = Map();

    map['UserName'] = UserName;
    map['DOB'] = dob;
    map['CityName'] = CityName;
    map['PhoneNo'] = PhoneNo;
    map['Gender'] = Gender;
    map['isFavourite'] = isFavourite;

    if (UserId != -1) {
      print('CALLING:::::UPDATE::::::');
      await db
          .update('userList', map, where: 'UserID = ?', whereArgs: [UserId]);
    } else {
      print('CALLING:::::INSERT::::::');
      await db.insert('userList', map);
    }
  }



  Future<List<UserModel>> getDataFromUserTable() async {
    bool fav = false;
    List<UserModel> userList = [];
    Database db = await initDatabase();
    List<Map<String, Object?>> data = await db.rawQuery(
        'SELECT U.UserID,U.UserName,U.PhoneNo,U.Photo,C.CityID,C.CityName,G.GenderID,G.GenderType,F.FavouriteID,F.FavoriteType FROM userList U Inner join mst_city C ON U.CityName = c.CityID Inner join Gender G ON U.Gender = G.GenderID Inner join Favourite F ON U.isFavourite = F.FavouriteID');

    for (int i = 0; i < data.length; i++) {
      if (data[i]['FavouriteID'] == 0) {
        fav = true;
      } else {
        fav = false;
      }
      ;
      UserModel model = UserModel(
          UserName1: data[i]['UserName'].toString(),
          PhoneNo1: data[i]['PhoneNo'] as int,
          Cityid1: data[i]['CityID'] as int,
          Photo1: data[i]['Photo'].toString(),
          GenderID1: data[i]['GenderID'] as int,
          IsFavourite1: fav,
          DOB1: data[i]['DOB'].toString());
      model.UserID = data[i]['UserID'] as int;
      print('USERLIST::::::::${userList.length}');

      userList.add(model);
    }
    return userList;
  }

  Future<List<UserModel>> getDataOfFavouriteUser() async {
    bool fav = true;
    List<UserModel> userList = [];
    Database db = await initDatabase();
    print('::::::::::::::::QUERY RUN ::::::::::::::::');
    List<Map<String, Object?>> data = await db.rawQuery(
        'SELECT U.UserID,U.UserName,U.PhoneNo,U.Photo,C.CityID,C.CityName,G.GenderID,G.GenderType,F.FavouriteID,F.FavoriteType FROM userList U Inner join mst_city C ON U.CityName = c.CityID Inner join Gender G ON U.Gender = G.GenderID Inner join Favourite F ON U.isFavourite = F.FavouriteID WHERE U.isFavourite == 0');
    print('::::::::::::::::QUERY FINISH ::::::::::::::::');
    for (int i = 0; i < data.length; i++) {


      UserModel model = UserModel(
          UserName1: data[i]['UserName'].toString(),
          PhoneNo1: data[i]['PhoneNo'] as int,
          Cityid1: data[i]['CityID'] as int,
          Photo1: data[i]['Photo'].toString(),
          GenderID1: data[i]['GenderID'] as int,
          IsFavourite1: fav,
          DOB1: data[i]['DOB'].toString());
      model.UserID = data[i]['UserID'] as int;
      print('USERLIST::::::::${userList.length}');

      userList.add(model);
    }
    return userList;
  }

  Future<List<UserModel>> getDataOfMaleUser() async {
    bool fav = false;
    List<UserModel> userList = [];
    Database db = await initDatabase();

    print('::::::::::::::::QUERY RUN ::::::::::::::::');
    List<Map<String, Object?>> data = await db.rawQuery(
        'SELECT U.UserID,U.UserName,U.PhoneNo,U.Photo,C.CityID,C.CityName,G.GenderID,G.GenderType,F.FavouriteID,F.FavoriteType FROM userList U Inner join mst_city C ON U.CityName = c.CityID Inner join Gender G ON U.Gender = G.GenderID Inner join Favourite F ON U.isFavourite = F.FavouriteID WHERE G.GenderID == 0');
    for (int i = 0; i < data.length; i++) {
      if (data[i]['FavouriteID'] == 0) {
        fav = true;
      } else {
        fav = false;
      }
      ;
      UserModel model = UserModel(
          UserName1: data[i]['UserName'].toString(),
          PhoneNo1: data[i]['PhoneNo'] as int,
          Cityid1: data[i]['CityID'] as int,
          Photo1: data[i]['Photo'].toString(),
          GenderID1: data[i]['GenderID'] as int,
          IsFavourite1: fav,
          DOB1: data[i]['DOB'].toString());
      model.UserID = data[i]['UserID'] as int;
      print('USERLIST::::::::${userList.length}');

      userList.add(model);
    }
    return userList;
  }

  Future<List<UserModel>> getDataOfFemaleUser() async {
    bool fav = false;
    List<UserModel> userList = [];
    Database db = await initDatabase();

    print('::::::::::::::::QUERY RUN ::::::::::::::::');
    List<Map<String, Object?>> data = await db.rawQuery(
        'SELECT U.UserID,U.UserName,U.PhoneNo,U.Photo,C.CityID,C.CityName,G.GenderID,G.GenderType,F.FavouriteID,F.FavoriteType FROM userList U Inner join mst_city C ON U.CityName = c.CityID Inner join Gender G ON U.Gender = G.GenderID Inner join Favourite F ON U.isFavourite = F.FavouriteID WHERE G.GenderID == 1');
    for (int i = 0; i < data.length; i++) {
      if (data[i]['FavouriteID'] == 0) {
        fav = true;
      } else {
        fav = false;
      }
      ;
      UserModel model = UserModel(
          UserName1: data[i]['UserName'].toString(),
          PhoneNo1: data[i]['PhoneNo'] as int,
          Cityid1: data[i]['CityID'] as int,
          Photo1: data[i]['Photo'].toString(),
          GenderID1: data[i]['GenderID'] as int,
          IsFavourite1: fav,
          DOB1: data[i]['DOB'].toString());
      model.UserID = data[i]['UserID'] as int;
      print('USERLIST::::::::${userList.length}');

      userList.add(model);
    }
    return userList;
  }


}
