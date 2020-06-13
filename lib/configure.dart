import 'src/configure_imp.dart' if (dart.library.html) 'src/configure_web.dart' as conf;

abstract class Configure {
  static Future<Configure> instance = conf.ConfigureImp.instance;

  void setString(String key, String value);

  String getString(String key);

  void setInt(String key, int value);

  int getInt(String key);

  void setDouble(String key, double value);

  double getDouble(String key);

  void setBool(String key, bool value);

  bool getBool(String key);

  void setStringList(String key, List<String> value);

  List<String> getStringList(String key);

  void setIntList(String key, List<int> value);

  List<int> getIntList(String key);

  void setDoubleList(String key, List<double> value);

  List<double> getDoubleList(String key);

  void setBoolList(String key, List<bool> value);

  List<bool> getBoolList(String key);
}
