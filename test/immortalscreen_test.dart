import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:immortalscreen/immortalscreen.dart';

void main() {
  const MethodChannel channel = MethodChannel('immortalscreen');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Immortalscreen.platformVersion, '42');
  });
}
