package com.bogon.test.testthreadsync;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity {

    private Handler mHandler = new Handler();
    
    private Button mStartButton;
    
    private Button mStopButton;
    
    private TextView mTextView;
    
    private Thread mThread;
    
    private int mId;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mStartButton = (Button)this.findViewById(R.id.button1);
        mStartButton.setOnClickListener(new OnClickListener() {
            
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                startProcessing();
            }
        });
        mStopButton = (Button)this.findViewById(R.id.button2);
        mStopButton.setOnClickListener(new OnClickListener() {
            
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                stopProcessing();
            }
        });
        mTextView = (TextView)this.findViewById(R.id.textView1);
    }

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
    
    private void startProcessing() {
        if (mThread == null) {
            mThread = new Thread(null, doBackgroundProcessing, "UpdateGUIThread");
            mThread.start();
        }
    }

    private void stopProcessing() {
        if (mThread != null) {
            if (mThread.isAlive() && !mThread.isInterrupted() &&
                    mThread.getState() != Thread.State.TERMINATED) {
                mThread.interrupt();
                mThread = null;
            }
        }
    }

    private Runnable doBackgroundProcessing = new Runnable() {
        
        @Override
        public void run() {
            // TODO Auto-generated method stub
            while (!Thread.currentThread().isInterrupted()) {
                try {
                    backgroundThreadProcessing();
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    Thread.currentThread().interrupt();
                }
            }
        }
    };
    
    private void backgroundThreadProcessing() throws InterruptedException {
        for (int i = 0; i < 10000; i++) {
            mId = i;
            Thread.sleep(100);
            mHandler.post(doUpdateGUI);
        }
    }
    
    private Runnable doUpdateGUI = new Runnable() {
        
        @Override
        public void run() {
            // TODO Auto-generated method stub
            updateTextView();
        }
    };
    
    private void updateTextView() {
        mTextView.setText("Thread send id = " + mId);
    }

    @Override
    protected void onDestroy() {
        // TODO Auto-generated method stub
        stopProcessing();
        super.onDestroy();
    }
}
