import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'configure_imp.dart' as imp;

class ConfigureImp extends imp.ConfigureImp {
  static Future<ConfigureImp> _instance;

  static Future<ConfigureImp> get instance {
    if (null != _instance) {
      return _instance;
    }

    var temp = ConfigureImp();
    return _instance = temp.reload().then((value) {
      return temp;
    });
  }

  @override
  Future<bool> reload() async {
    var storage = html.window.localStorage;
    if (storage.containsKey("configure_save")) {
      map = json.decode(storage["configure_save"]);
    }
    return Future.value(true);
  }

  @override
  Future<bool> save() {
    var storage = html.window.localStorage;
    storage["configure_save"] = json.encode(map);
    return Future.value(true);
  }
}
