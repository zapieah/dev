package com.bogon.test.threadpooltest.threadpool;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import android.util.Log;

public class UnitThreadPoolExecutor extends ThreadPoolExecutor{

    private static final String TAG = UnitThreadPoolExecutor.class.getSimpleName();
    
    private static final boolean D = true;
    
    private CopyOnWriteArrayList<Runnable> mUnitThreadList;

    public UnitThreadPoolExecutor(int corePoolSize, int maximumPoolSize,
            long keepAliveTime, TimeUnit unit, BlockingQueue<Runnable> workQueue) {
        super(corePoolSize, maximumPoolSize, keepAliveTime, unit, workQueue);
        if (D) Log.d(TAG, "UnitThreadPoolExecutor");
        mUnitThreadList = new CopyOnWriteArrayList<Runnable>();
    }

    @Override
    protected void beforeExecute(Thread t, Runnable r) {
        // TODO Auto-generated method stub
        if (D) Log.d(TAG, "beforeExecute");
        mUnitThreadList.add(r);
        super.beforeExecute(t, r);
    }

    @Override
    protected void afterExecute(Runnable r, Throwable t) {
        // TODO Auto-generated method stub
        if (D) Log.d(TAG, "afterExecute");
        mUnitThreadList.remove(r);
        super.afterExecute(r, t);
    }
    
    public int getUnitThreadCount() {
        if (D) Log.d(TAG, "getUnitThreadCount");
        return mUnitThreadList.size();
    }
    
    public CopyOnWriteArrayList<Runnable> getUnitThreadList() {
        if (D) Log.d(TAG, "getUnitThreadList");
        return mUnitThreadList;
    }
}
