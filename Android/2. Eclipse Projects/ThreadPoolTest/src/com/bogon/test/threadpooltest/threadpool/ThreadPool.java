package com.bogon.test.threadpooltest.threadpool;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import android.util.Log;

public class ThreadPool {

    private static final String TAG = ThreadPool.class.getSimpleName();

    private static final boolean D = true;
    
    private static final long KEEP_ALIVE_TIME = 1L;
    
    private BlockingQueue<Runnable> mThreadQueue = null;
    
    protected UnitThreadPoolExecutor mExecutor = null;
    
    private static final int CORE_POOL_SIZE = Runtime.getRuntime().availableProcessors();
            
    public ThreadPool() {
        if (D) Log.d(TAG, "ThreadPool");
        mThreadQueue = new LinkedBlockingQueue<Runnable>();
        mExecutor = new UnitThreadPoolExecutor(CORE_POOL_SIZE, CORE_POOL_SIZE * 2,
                KEEP_ALIVE_TIME, TimeUnit.SECONDS, mThreadQueue);
    }
    
    public void executeUnitThread(UnitThread nt) {
        if (D) Log.d(TAG, "executeUnitThread");
        if (null != nt) {
            nt.setName("UnitThread" + nt.getUnitThreadId());
            mExecutor.execute(nt);
        }
    }

    public void notifyUnitThread(int id) {
        if (D) Log.d(TAG, "notifyUnitThread");
        for (Runnable t : mExecutor.getUnitThreadList()) {
            if (((UnitThread)t).getUnitThreadId() == id) {
                if (((UnitThread)t).getUnitThreadState() == UnitThread.STATE_WAITING)
                    ((UnitThread)t).notifyThread();
            }
        }
    }
    
    public void notifyUnitThreadAll() {
        if (D) Log.d(TAG, "notifyUnitThreadAll");
        for (Runnable t : mExecutor.getUnitThreadList()) {
            if (((UnitThread) t).getUnitThreadState() == UnitThread.STATE_WAITING)
                ((UnitThread)t).notifyThread();
        }
    }

    public boolean setMaxUnitThreadNumber(int max) {
        if (D) Log.d(TAG, "setMaxUnitThreadNumber");
        try {
            mExecutor.setMaximumPoolSize(max);
        }
        catch (java.lang.IllegalArgumentException iae) {
            Log.e(TAG, "IllegalArgumentException");    
            return false;
        }
        return true;
    }
    
    public boolean allowUnitThreadTimeOut(boolean isAllow) {
        if (D) Log.d(TAG, "allowUnitThreadTimeOut");
        try {
            mExecutor.allowCoreThreadTimeOut(isAllow);
        }
        catch (java.lang.IllegalArgumentException iae) {
            Log.e(TAG, "IllegalArgumentException");
            return false;
        }
        return true;
    }
    
    public void shutdownUnitThread() {
        if (D) Log.d(TAG, "shutdownUnitThread");
        try {
            if (mExecutor.getTaskCount() == 0)
                mExecutor.shutdownNow();
            else {
                if (mThreadQueue.size() > 0) {
                    if (D) Log.d(TAG, "mThreadQueue clear");
                    mThreadQueue.clear();
                    mThreadQueue = null;
                }
                notifyUnitThreadAll();
                mExecutor.shutdown();
                int i = 0;
                while (i <= 50) {
                    Thread.sleep(100);
                    if (mExecutor.isTerminated()) {
                        break;
                    }
                    i++;
                }
                mExecutor = null;
            }
        } catch (Exception ex) {
            Log.e(TAG, "Exception");
        }
    }

    public int getUnitThreadCount() {
        if (D) Log.d(TAG, "getUnitThreadCount");
        return mExecutor.getUnitThreadCount();
    }
}