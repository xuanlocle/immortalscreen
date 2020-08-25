import 'dart:async';

import 'package:flutter/services.dart';

class Immortalscreen {
  static const MethodChannel _channel = const MethodChannel('immortalscreen');

  static final String SET_SCREEN_ALWAYS_ON = "SET_SCREEN_ALWAYS_ON";
  static final String REMOVE_SCREEN_ALWAYS_ON = "REMOVE_SCREEN_ALWAYS_ON";

  static Future<bool> get setScreenAlwaysOn async {
    final bool status = await _channel.invokeMethod(SET_SCREEN_ALWAYS_ON);
    return status;
  }

  static Future<bool> get resetScreenAlwaysOn async {
    final bool status = await _channel.invokeMethod(REMOVE_SCREEN_ALWAYS_ON);
    return status;
  }
}
