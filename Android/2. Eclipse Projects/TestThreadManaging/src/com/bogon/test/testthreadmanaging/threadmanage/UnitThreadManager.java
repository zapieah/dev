package com.bogon.test.testthreadmanaging.threadmanage;

import java.util.concurrent.CopyOnWriteArrayList;

import android.util.Log;

public class UnitThreadManager {
    
    private static final String TAG = UnitThreadManager.class.getSimpleName();

    private static final boolean D = true;

    private static UnitThreadManager sInstance;

    private CopyOnWriteArrayList<UnitThread> mThreadPool;
    
    public static final int DEFAULT_THREAD_LIMIT_COUNT = 10;
    
    private int mMaxThreadCount;
    
    public static synchronized UnitThreadManager getInstance() {
        if (D) Log.d(TAG, "getInstance");
        if (sInstance == null) {
            sInstance = new UnitThreadManager();
        }
        return sInstance;
    }
    
    private UnitThreadManager() {
        if (D) Log.d(TAG, "UnitThreadManager");
        mMaxThreadCount = DEFAULT_THREAD_LIMIT_COUNT;
        mThreadPool = new CopyOnWriteArrayList<UnitThread>();
    }
    
    public void setMaxThreadCount(int max) {
        if (D) Log.d(TAG, "setMaxThreadCount");
        mMaxThreadCount = max;
    }

    public int getMaxThreadCount() {
        if (D) Log.d(TAG, "getMaxThreadCount");
        return mMaxThreadCount;
    }
    
    public int getThreadCount() {
        if (D) Log.d(TAG, "getThreadCount");
        return mThreadPool.size();
    }
    
    public CopyOnWriteArrayList<Integer> getThreadIdAll() {
        if (D) Log.d(TAG, "getThreadIdAll");
        if (mThreadPool != null) {
            CopyOnWriteArrayList<Integer> idList = new CopyOnWriteArrayList<Integer>();
            if (mThreadPool != null) {
                for (UnitThread t : mThreadPool) {
                    idList.add(t.getUnitThreadId());
                }
            }
            return idList;
        }
        return null;
    }

    public int getUnitThreadState(int id) {
        //if (D) Log.d(TAG, "getUnitThreadState");
        if (mThreadPool != null) {
            for (UnitThread t : mThreadPool) {
                if (t.getUnitThreadId() == id) {
                    return t.getUnitThreadState();
                }
            }
        }
        return UnitThread.STATE_UNKNOWN;
    }
    
    public void waitThread(int id) {
        if (D) Log.d(TAG, "waitThread");
        if (mThreadPool != null) {
            for (UnitThread t : mThreadPool) {
                if (t.getUnitThreadId() == id) {
                    if (t.getUnitThreadState() == UnitThread.STATE_RUNNING)
                        t.waitThread();
                }
            }
        }
    }

    public void waitThreadAll() {
        if (D) Log.d(TAG, "waitThreadAll");
        if (mThreadPool != null) {
            for (UnitThread t : mThreadPool) {
                if (t.getUnitThreadState() == UnitThread.STATE_RUNNING)
                    t.waitThread();
            }
        }
    }

    public void notifyThread(int id) {
        if (D) Log.d(TAG, "notifyThread");
        if (mThreadPool != null) {
            for (UnitThread t : mThreadPool) {
                if (t.getUnitThreadId() == id) {
                    if (t.getUnitThreadState() == UnitThread.STATE_WAITING)
                        t.notifyThread();
                }
            }
        }
    }
    
    public void notifyThreadAll() {
        if (D) Log.d(TAG, "notifyThreadAll");
        if (mThreadPool != null) {
            for (UnitThread t : mThreadPool) {
                if (t.getUnitThreadState() == UnitThread.STATE_WAITING)
                    t.notifyThread();
            }
        }
    }

    public boolean execute(UnitThread ut) {
        if (D) Log.d(TAG, "execute");
        if (mThreadPool.size() >= mMaxThreadCount) {
            Log.e(TAG, "Threadpool full, please, run it later");
            return false;
        }
        else {
            mThreadPool.add(ut);
            ut.setStateChangeCallback(mStateCallback);
            ut.start();
            return true;
        }
    }
    
    public void shutdown() {
        if (D) Log.d(TAG, "shutdown");
        for (UnitThread t : mThreadPool) {
            if (t.getUnitThreadState() == UnitThread.STATE_WAITING)
                t.notifyThread();
        }
        try {
            Thread.sleep(300);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        for (UnitThread t : mThreadPool) {
            if (t.getUnitThreadState() != UnitThread.STATE_NONE)
                t.interrupt();
        }
    }
    
    private IStateCallback mStateCallback = new IStateCallback() {
        @Override
        public void onStateChanged(int id, int preState, int newState) {
            // TODO Auto-generated method stub
            if (D) Log.d(TAG, "onStateChanged");
            if ((preState == UnitThread.STATE_RUNNING && newState == UnitThread.STATE_NONE) ||
                    (preState == UnitThread.STATE_WAITING && newState == UnitThread.STATE_NONE)) {
                for (UnitThread t : mThreadPool) {
                    if (t.getUnitThreadId() == id)
                        mThreadPool.remove(t);
                }
            }
        }
    };
}
