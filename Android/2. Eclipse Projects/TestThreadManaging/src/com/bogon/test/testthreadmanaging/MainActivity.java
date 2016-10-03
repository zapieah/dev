package com.bogon.test.testthreadmanaging;

import java.util.concurrent.CopyOnWriteArrayList;

import com.bogon.test.testthreadmanaging.threadmanage.UnitThread;
import com.bogon.test.testthreadmanaging.threadmanage.IUnitThreadCallback;
import com.bogon.test.testthreadmanaging.threadmanage.UnitThreadManager;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.Toast;

public class MainActivity extends Activity {
    
    private static final String TAG = MainActivity.class.getSimpleName();
    
    private Button mStartButton;
    
    private Button mWaitButton;
    
    private Button mNotifyButton;
    
    private Context mContext;
    
    private int mId;

    @Override
    protected void onDestroy() {
        // TODO Auto-generated method stub
        UnitThreadManager.getInstance().shutdown();
        super.onDestroy();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mContext = this;
        mId = 0;
        mStartButton = (Button)this.findViewById(R.id.start_button);
        mStartButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                makeThread(mId++);
            }
        });

        mWaitButton = (Button)this.findViewById(R.id.wait_button);
        mWaitButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                waitThread();
            }
        });

        mNotifyButton = (Button)this.findViewById(R.id.notify_button);
        mNotifyButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                notifyThread();
            }
        });
    }
    
    public void makeThread(int id) {
        UnitThread ut = new UnitThread(id, mCallback, true);
        if (!UnitThreadManager.getInstance().execute(ut))
            Toast.makeText(mContext, "Threadpool full, please, run it later", Toast.LENGTH_SHORT).show();
    }

    public void waitThread() {
        CopyOnWriteArrayList<Integer> threadList = UnitThreadManager.getInstance().getThreadIdAll();
        for (int i = 0; i < threadList.size(); i++) {
            if (UnitThreadManager.getInstance().getUnitThreadState(threadList.get(i)) == UnitThread.STATE_RUNNING) {
                UnitThreadManager.getInstance().waitThread(threadList.get(i));
                break;
            }
        }
    }

    public void notifyThread() {
        CopyOnWriteArrayList<Integer> threadList = UnitThreadManager.getInstance().getThreadIdAll();
        for (int i = 0; i < threadList.size(); i++) {
            if (UnitThreadManager.getInstance().getUnitThreadState(threadList.get(i)) == UnitThread.STATE_WAITING) {
                UnitThreadManager.getInstance().notifyThread(threadList.get(i));
                break;
            }
        }
    }

    private IUnitThreadCallback mCallback = new IUnitThreadCallback() {
        
        @Override
        public void onThreadFinishedCallback(int UnitThreadId, Object o) {
            // TODO Auto-generated method stub
            Log.i(TAG, "onThreadFinishedCallback id = " + UnitThreadId); 
        }
    };

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
