package com.xuanlocle.immortalscreen;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;


class ImmortalscreenPlugin implements MethodCallHandler {

    static void registerWith(Registrar registrar) {
        MethodChannel channel = new MethodChannel(registrar.messenger(), "immortalscreen");
        channel.setMethodCallHandler(new ImmortalscreenPlugin());
    }


    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}");
        } else {
            result.notImplemented();
        }
    }
}
