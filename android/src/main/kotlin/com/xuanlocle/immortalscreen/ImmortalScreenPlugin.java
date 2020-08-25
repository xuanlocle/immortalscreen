package com.xuanlocle.immortalscreen;

import android.view.WindowManager;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;


public class ImmortalScreenPlugin implements MethodCallHandler {

    private static ImmortalUseCase immortalUseCase = ImmortalUseCase.getInstance();
    private static final String SET_SCREEN_ALWAYS_ON = "SET_SCREEN_ALWAYS_ON";
    private static final String REMOVE_SCREEN_ALWAYS_ON = "REMOVE_SCREEN_ALWAYS_ON";

    public static void registerWith(Registrar registrar) {
        MethodChannel channel = new MethodChannel(registrar.messenger(), "immortalscreen");
        channel.setMethodCallHandler(new ImmortalScreenPlugin());
        immortalUseCase.setUsingActivity(registrar.activity());
    }


    @Override
    public void onMethodCall(MethodCall call, Result result) {
        Boolean needScreenOn = null;
        switch (call.method) {
            case SET_SCREEN_ALWAYS_ON:
                needScreenOn = true;
                break;
            case REMOVE_SCREEN_ALWAYS_ON:
                needScreenOn = false;
                break;
            default:
                result.notImplemented();
                return;
        }

        if (immortalUseCase.checkActivityReady()) {
            if (needScreenOn)
                immortalUseCase.getUsingActivity().getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            else
                immortalUseCase.getUsingActivity().getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);

            result.success(true);
        } else {
            result.success(false);
        }
    }
}

