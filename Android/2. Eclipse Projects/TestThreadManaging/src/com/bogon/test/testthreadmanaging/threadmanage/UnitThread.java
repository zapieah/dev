package com.bogon.test.testthreadmanaging.threadmanage;

import android.util.Log;

public class UnitThread extends Thread{
    
    public static final String TAG = UnitThread.class.getSimpleName();

    public static final boolean D = true;
    
    public static final int STATE_UNKNOWN = -1;
    
    public static final int STATE_NONE = 0;
    
    public static final int STATE_RUNNING = 1;
    
    public static final int STATE_WAITING = 2;
    
    private int mId;
    
    private IUnitThreadCallback mCallback;
    
    private IStateCallback mStateCallback;
    
    private int mState;
    
    private Object LOCK_OBJECT;
    
    private boolean mIsLooping;
    
    private boolean mIsWait;
    
    public UnitThread(int id, IUnitThreadCallback callback, boolean isLooping) {
        if (D) Log.d(TAG, "UnitThread");
        mId = id;
        mCallback = callback;
        mIsLooping = isLooping;
        mIsWait = false;
        LOCK_OBJECT = new Object();
        setUnitThreadState(STATE_NONE);
    }
    
    public int getUnitThreadId() {
        if (D) Log.d(TAG, "getUnitThreadId");
        return mId;
    }
    
    public void waitThread() {
        if (D) Log.d(TAG, "waitThread");
        if (!mIsWait) {
            mIsWait = true;
        }
    }
    
    private void waitThreadImpl() throws InterruptedException {
        synchronized (UnitThread.this) {
            if (mIsWait) {
                if (getUnitThreadState() == STATE_RUNNING) {
                    setUnitThreadState(STATE_WAITING);
                    UnitThread.this.wait();
                }
            }
        }
    }
    
    public void notifyThread() {
        if (D) Log.d(TAG, "notifyThread");
        synchronized (UnitThread.this) {
            if (mState == STATE_WAITING) {
                mIsWait = false;
                setUnitThreadState(STATE_RUNNING);
                UnitThread.this.notify();
            }
        }
    }
    
    public int getUnitThreadState() {
        //if (D) Log.d(TAG, "getUnitThreadState");
        synchronized (LOCK_OBJECT) {
            return mState;
        }
    }
    
    private void setUnitThreadState(int state) {
        if (D) Log.d(TAG, "setUnitThreadState");
        synchronized (LOCK_OBJECT) {
            if (mStateCallback != null)
                mStateCallback.onStateChanged(mId, mState, state);
            mState = state;
        }
    }
    
    public void setStateChangeCallback(IStateCallback callback) {
        mStateCallback = callback;
    }
    
    public boolean isLoopingThread() {
        return mIsLooping;
    }

    @Override
    public void run() {
        // TODO Auto-generated method stub
        if (getUnitThreadState() == STATE_NONE) {
            try {
                setUnitThreadState(STATE_RUNNING);
                if (mIsLooping) {
                    Log.d(TAG, "run looping + id = " + mId);
                    while (!Thread.currentThread().isInterrupted()) {
                        Thread.sleep(100);
                        if (mIsWait)
                            waitThreadImpl();
                    }
                    Log.d(TAG, "run looping - id = " + mId);
                }
                else {
                    Log.d(TAG, "run + id = " + mId);
                    waitThread();
                    waitThreadImpl();
                    Log.d(TAG, "run - id = " + mId);
                }
                mCallback.onThreadFinishedCallback(mId, new Object());
                setUnitThreadState(STATE_NONE);
            }
            catch(java.lang.Exception e) {
                Thread.currentThread().interrupt();
                setUnitThreadState(STATE_NONE);
            }
            finally {
                setUnitThreadState(STATE_NONE);
            }
        }
    }
}
