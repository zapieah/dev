package com.bogon.test.threadloopertest;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity {

    private static final String TAG = MainActivity.class.getSimpleName();
            
    private Handler mManHandler;
    private Handler mWomanHandler;
    
    private Button mStartButton;
    
    private TextView mConversationTextView;
    
    private ThreadWoman mWoman;
    private ThreadMan mMan;
    
    private static final int MAX_CONVERSATION_COUNT = 10;
    
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mStartButton = (Button)this.findViewById(R.id.button1);
        mStartButton.setOnClickListener(new OnClickListener() {
            
            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                startConversation();
            }
        });
        mConversationTextView = (TextView)this.findViewById(R.id.textView1);
        mConversationTextView.setText("");
    }

    private void startConversation() {
        if (mWoman == null && mMan == null) {
            mWoman = new ThreadWoman();
            mMan = new ThreadMan();
            mWoman.start();        
            mMan.start();
            for (;;) {
                if (mManHandler != null) {
                    mManHandler.sendMessage(new Message());
                    break;
                }
            }
        }
        else {
            mConversationTextView.append("Thread and Handler was destroyed\n");
        }
    }
    
    private void stopConversation() {
        if (mWoman != null && mWoman.getState() != Thread.State.TERMINATED)
            mWoman.interrupt();
        if (mMan != null && mMan.getState() != Thread.State.TERMINATED)
            mMan.interrupt();
        mWoman = null;
        mMan = null;

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
    
    private class ThreadMan extends Thread {
        @Override
        public void run() {
            // TODO Auto-generated method stub
            Looper.prepare();
            mManHandler = new Handler() {
                private int mCallCount = 0;
                @Override
                public void handleMessage(Message msg) {
                    // TODO Auto-generated method stub
                    mCallCount++;
                    Message.obtain(mMainHandler, 0, "Man said = Hey!!!\n").sendToTarget();
                    try {
                        Thread.sleep(500);
                    } catch (InterruptedException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                        Looper.myLooper().quit();
                    }
                    if (mCallCount >= MAX_CONVERSATION_COUNT) {
                        Message.obtain(mMainHandler, 0, "Man said = Bye Woman!!!\n").sendToTarget();
                        Looper.myLooper().quit();
                    }
                    if (mWomanHandler != null)
                        mWomanHandler.sendMessage(new Message());
                }
            };
            Looper.loop();
        }
    };
    
    private class ThreadWoman extends Thread {
        @Override
        public void run() {
            // TODO Auto-generated method stub
            Looper.prepare();
            mWomanHandler = new Handler() {
                private int mAnswerCount = 0;
                
                @Override
                public void handleMessage(Message msg) {
                    // TODO Auto-generated method stub
                    mAnswerCount++;
                    Message.obtain(mMainHandler, 1, "Woman said = Why???\n").sendToTarget();
                    try {
                        Thread.sleep(500);
                    } catch (InterruptedException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                        Looper.myLooper().quit();
                    }
                    if (mAnswerCount >= MAX_CONVERSATION_COUNT) {
                        Message.obtain(mMainHandler, 1, "Woman said = Bye Man!!!\n").sendToTarget();
                        Looper.myLooper().quit();
                    }
                    else {
                        if (mManHandler != null)
                            mManHandler.sendMessage(new Message());
                    }
                }
            };
            Looper.loop();
        }
    };

    private Handler mMainHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            mConversationTextView.append((String)msg.obj);
        }
    };
    
    @Override
    protected void onDestroy() {
        // TODO Auto-generated method stub
        stopConversation();
        super.onDestroy();
    }
}
