package com.xuanlocle.immortalscreen;

import android.app.Activity;

class ImmortalUseCase {

    private static ImmortalUseCase instance;
    private Activity usingActivity;

    private ImmortalUseCase() {
    }

    static ImmortalUseCase getInstance() {
        if (instance == null)
            instance = new ImmortalUseCase();
        return instance;
    }

    void setUsingActivity(Activity usingActivity) {
        this.usingActivity = usingActivity;
    }

    Activity getUsingActivity() {
        return usingActivity;
    }

    boolean checkActivityReady(){
      return usingActivity != null;
    }
}
