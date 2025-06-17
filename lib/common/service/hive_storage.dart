import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_cabinet_app/data/dto/response/auth/login/get_user_response.dart';
import 'package:student_cabinet_app/data/dto/response/auth/token/token_response.dart';

class HiveStorage {
  static final HiveStorage _instance = HiveStorage._internal();

  static const String storageName = "arm_mobile_hive";

  HiveStorage._internal();

  static HiveStorage get instance => _instance;

  late Box<dynamic> _storage;

  Future<HiveStorage> init() async {
    await Hive.initFlutter("");
    _registerAdapters();

    // It's recommended to register all TypeAdapters before opening any boxes.
    await deleteStorage();
    await openBox();

    return this;
  }

  Future<void> deleteByKey(String key) async {
    await _storage.delete(key);
  }

  Iterable<dynamic> initialKeys() => _storage.keys;

  void _registerAdapters() {
    Hive.registerAdapter(TokenResponseAdapter());
    Hive.registerAdapter(GetUserResponseAdapter());
  }

  Future<void> openBox() async {
    // создаст если не сущ
    try {
      _storage = await Hive.openBox(storageName);
      log('хранилище создано');
    } catch (e){
      log(e.toString());
    }
  }

  Future<void> deleteStorage() async {
    try {
      // мб прост из фс удалить без hive открытия
      var box = await Hive.openBox(storageName);
      await box.deleteFromDisk();
      log('хранилище удаленно');
    } catch (e) {
      log('Ошибка при удалении хранилища: ${e.toString()}');
    }
  }

  Future<void> clearStorage() async {
    try {
      await _storage.clear();
      log('хранилище очищенно');
    } catch (e) {
      log('Ошибка при очистке хранилища: ${e.toString()}');
    }
  }

  Future<void> setValue(String key, dynamic value) async {
    try {
      await _storage.put(key, value);
    } catch (e) {
      log('Ошибка при установке значения для ключа $key: ${e.toString()}');
    }
  }

  Future<void> saveMap<T>(String boxName, String key, T value) async {
    final box = Hive.box<T>(boxName);
    await box.put(key, value);
  }

  bool? getBoolByKey(String key) {
    return _storage.get(key) as bool?;
  }

  String? getStringByKey(String key) {
    return _storage.get(key) as String?;
  }

  dynamic getObjectByKey(String key) {
    return _storage.get(key);
  }
}
