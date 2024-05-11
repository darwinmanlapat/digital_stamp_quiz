import 'package:digital_stamp_quiz/common/hive/models/digital_stamp.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveStorageService<T> {
  HiveStorageService(HiveInterface hive) : _hive = hive;

  final HiveInterface _hive;
  late Box _box;

  // Initialize Hive and open the box
  Future<void> init(String boxName) async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await _hive.initFlutter(appDocumentDir.path);
    _registerTypeAdapters();
    _box = await _hive.openBox(boxName);
  }

  Future<void> addData(String key, T data) async {
    await _box.put(key, data);
  }

  //read
  dynamic getData(String key)  {
    return _box.get(key);
  }

  // Remove data from local storage
  Future<void> removeData(String key) async {
    await _box.delete(key);
  }

  // Delete box from device local disk
  Future<void> deleteBox() async {
    await _box.deleteFromDisk();
  }

  // Close the Hive box
  Future<void> close() async {
    await _box.close();
  }

  void _registerTypeAdapters() {
    _hive.registerAdapter(DigitalStampAdapter());
    _hive.registerAdapter(StampItemAdapter());
  }
}
