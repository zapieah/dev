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
        else {
            sThreadPoolInstance.reInit();
        }
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
        if (mThreadPool != null)
            mThreadPool.executeUnitThread(nt);
    }

    public void waitThread(int id) {
        if (D) Log.d(TAG, "waitThread");
        if (mThreadPool != null)
            mThreadPool.waitUnitThread(id);        
    }

    public void waitThreadAll() {
        if (D) Log.d(TAG, "waitThreadAll");
        if (mThreadPool != null)
            mThreadPool.notifyUnitThreadAll();
    }

    public void notifyThread(int id) {
        if (D) Log.d(TAG, "notify");
        if (mThreadPool != null)
            mThreadPool.notifyUnitThread(id);
    }
    
    public void notifyThreadAll() {
        if (D) Log.d(TAG, "notifyThreadAll");
        if (mThreadPool != null)
            mThreadPool.notifyUnitThreadAll();
    }

    public boolean setMaxThreadNumber(int max) {
        if (D) Log.d(TAG, "setMaxThreadNumber");
        if (mThreadPool != null)
            return mThreadPool.setMaxUnitThreadNumber(max);
        return false;
    }
    
    public void allowThreadTimeOut(boolean isAllow) {
        if (D) Log.d(TAG, "allowThreadTimeOut");
        if (mThreadPool != null)
            mThreadPool.allowUnitThreadTimeOut(isAllow);
    }
    
    public void shutdownThread() {
        if (D) Log.d(TAG, "shutdownThread");
        if (mThreadPool != null) {
            mThreadPool.shutdownUnitThread();
            mThreadPool = null;
        }
    }

    public int getThreadCount() {
        if (D) Log.d(TAG, "getThreadCount");
        if (mThreadPool != null)
            return mThreadPool.getUnitThreadCount();
        return -1;
    }
}