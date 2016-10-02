package com.bogon.test.threadpooltest.threadpool;

public interface IStateCallback {
    
    void onStateChanged(int id, int preState, int newState);
    
}
