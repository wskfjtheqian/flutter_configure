import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter_web_plugins/src/plugin_registry.dart';

import 'configure.dart';

class ConfigureWeb extends Configure {
  static void registerWith(Registrar registrarFor) {
    Configure.instance = Future.value(ConfigureWeb());
  }

  @override
  Future<bool> reload() {
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
