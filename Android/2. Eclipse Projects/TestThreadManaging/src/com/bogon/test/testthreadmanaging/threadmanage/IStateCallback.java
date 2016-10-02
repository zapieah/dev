package com.bogon.test.testthreadmanaging.threadmanage;

public interface IStateCallback {
    
    void onStateChanged(int id, int preState, int newState);
    
}
