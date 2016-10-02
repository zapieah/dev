package com.bogon.test.threadpooltest;

import com.bogon.test.threadpooltest.threadpool.IUnitThreadCallback;
import com.bogon.test.threadpooltest.threadpool.ThreadPoolManager;
import com.bogon.test.threadpooltest.threadpool.UnitThread;
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
    
    private static final int MAX_TEST_THREAD_COUNT = 50;
    
    private Button mStartButton;
    
    private Button mNotifyButton;
    
    private int mThreadId;
    
    private Context mContext;
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mContext = this;
        mThreadId = 0;
        mStartButton = (Button)this.findViewById(R.id.start_button);
        mStartButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                if (ThreadPoolManager.getInstance().getThreadCount() == 0) {
                    for (int i = 0; i < MAX_TEST_THREAD_COUNT; i++)
                        makeThread(i);
                }
                else {
                    Toast.makeText(mContext, "Thread is already running", Toast.LENGTH_SHORT).show();
                }
            }
        });
        mNotifyButton = (Button)this.findViewById(R.id.notify_button);
        mNotifyButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                ThreadPoolManager.getInstance().notifyThread(mThreadId++);
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
    public void makeThread(int id) {
        UnitThread nt = new UnitThread(id, mCallback, false);
        ThreadPoolManager.getInstance().executeThread(nt);
    }

    public void notifyThread(int id) {
        ThreadPoolManager.getInstance().notifyThread(1);
    }

    private IUnitThreadCallback mCallback = new IUnitThreadCallback() {
        
        @Override
        public void onThreadFinishedCallback(int UnitThreadId, Object o) {
            // TODO Auto-generated method stub
            Log.i(TAG, "onThreadFinishedCallback id = " + UnitThreadId); 
        }
    };
    
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

    @Override
    protected void onDestroy() {
        // TODO Auto-generated method stub
        ThreadPoolManager.getInstance().shutdownThread();
        super.onDestroy();
    }
}
