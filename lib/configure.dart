import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Configure {
  static Future<Configure> _instance;

  static Future<Configure> get instance {
    if (null != _instance) {
      return _instance;
    }

    var temp = Configure();
    return temp.reload().then((value) {
      return temp;
    });
  }

  static set instance(Future<Configure> value) {
    _instance = value;
  }

  Map<String, dynamic> _map = {};

  Map<String, dynamic> get map => _map;

  set map(Map<String, dynamic> value) {
    _map = value;
  }

  File _configureFile;

  Future<bool> reload() async {
    Directory appDocDir = Platform.isWindows ? Directory("") : await getApplicationSupportDirectory();
    _configureFile = File('${appDocDir.path}/configure_save.json');
    if (!_configureFile.existsSync()) {
      _configureFile.createSync();
    }
    return _configureFile.readAsString().then((value) {
      if (null != value && value.isNotEmpty) {
        try {
          _map = json.decode(value);
        } catch (e) {}
      }
      return true;
    });
  }

  @override
  Future<bool> save() {
    return _configureFile.writeAsString(json.encode(map)).then((value) => true);
  }

  void setString(String key, String value) {
    _map[key] = value;
    save();
  }

  String getString(String key) {
    return map[key]?.toString();
  }

  void setInt(String key, int value) {
    _map[key] = value;
    save();
  }

  int getInt(String key) {
    var temp = map[key];
    return null == temp ? null : (temp is num ? temp.toInt() : int.tryParse(temp));
  }

  void setDouble(String key, double value) {
    _map[key] = value;
    save();
  }

  double getDouble(String key) {
    var temp = map[key];
    return null == temp ? null : (temp is num ? temp.toDouble() : double.tryParse(temp));
  }

  void setBool(String key, bool value) {
    _map[key] = value;
    save();
  }

  bool getBool(String key) {
    var temp = map[key];
    return null == temp ? null : (temp is bool ? bool : bool.fromEnvironment(temp));
  }

  void setStringList(String key, List<String> value) {
    _map[key] = value;
    save();
  }

  List<String> getStringList(String key) {
    var temp = map[key];
    return null == temp ? [] : (temp is List ? temp.map((map) => map?.toString()).toList() : []);
  }

  void setIntList(String key, List<int> value) {
    _map[key] = value;
    save();
  }

  List<int> getIntList(String key) {
    var temp = map[key];
    return null == temp ? [] : (temp is List ? temp.map((map) => null == map ? null : (map is num ? map.toInt() : int.tryParse(map))).toList() : []);
  }

  void setDoubleList(String key, List<double> value) {
    _map[key] = value;
    save();
  }

  List<double> getDoubleList(String key) {
    var temp = map[key];
    return null == temp ? [] : (temp is List ? temp.map((map) => null == map ? null : (map is num ? map.toDouble() : double.tryParse(map))).toList() : []);
  }

  void setBoolList(String key, List<bool> value) {
    _map[key] = value;
    save();
  }

  List<bool> getBoolList(String key) {
    var temp = map[key];
    return null == temp ? [] : (temp is List ? temp.map((map) => null == map ? null : (map is num ? map : bool.fromEnvironment(map))).toList() : []);
  }
}
