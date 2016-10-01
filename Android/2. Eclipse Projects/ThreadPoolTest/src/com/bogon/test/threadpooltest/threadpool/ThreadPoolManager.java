package com.bogon.test.threadpooltest.threadpool;

import android.util.Log;

public class ThreadPoolManager {

    private static final String TAG = ThreadPoolManager.class.getSimpleName();

    private static final boolean D = true;
    
    private static ThreadPoolManager sThreadPoolInstance;

    private ThreadPool mThreadPool;
            
    public static synchronized ThreadPoolManager getInstance() {
        if (D) Log.d(TAG, "getInstance");
        if (sThreadPoolInstance == null) {
            sThreadPoolInstance = new ThreadPoolManager();
        }
        sThreadPoolInstance.reInit();
        return sThreadPoolInstance;
    }
    
    private ThreadPoolManager() {
        if (D) Log.d(TAG, "ThreadPoolManager");
        mThreadPool = new ThreadPool();
    }

    private void reInit() {
        if (mThreadPool == null)
            mThreadPool = new ThreadPool();
    }
    public void executeThread(UnitThread nt) {
        if (D) Log.d(TAG, "execute");
        mThreadPool.executeUnitThread(nt);
    }

    public void notifyThread(int id) {
        if (D) Log.d(TAG, "notify");
        mThreadPool.notifyUnitThread(id);
    }
    
    public void notifyAllThread() {
        if (D) Log.d(TAG, "notifyAllThread");
        mThreadPool.notifyUnitThreadAll();
    }

    public boolean setMaxThreadNumber(int max) {
        if (D) Log.d(TAG, "setMaxThreadNumber");
        return mThreadPool.setMaxUnitThreadNumber(max);
    }
    
    public void allowThreadTimeOut(boolean isAllow) {
        if (D) Log.d(TAG, "allowThreadTimeOut");
        mThreadPool.allowUnitThreadTimeOut(isAllow);
    }
    
    public void shutdownThread() {
        if (D) Log.d(TAG, "shutdownThread");
        mThreadPool.shutdownUnitThread();
        mThreadPool = null;
    }

    public int getThreadCount() {
        if (D) Log.d(TAG, "getThreadCount");
        return mThreadPool.getUnitThreadCount();
    }
}