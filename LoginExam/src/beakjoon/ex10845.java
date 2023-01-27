package beakjoon;

import java.util.*;
import java.io.*;

public class ex10845 {
	public static void main(String[] args) throws IOException {
		Queue<Integer> inQueue = new LinkedList<>();
	    Queue<Integer> outQueue = new LinkedList<>();
	    int back = 0;
	    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	    int n = Integer.parseInt(br.readLine());
	    String str;
	    for (int i = 0; i < n; i++) {
	      str = br.readLine();
	      if (str.equals("pop")) {
	        if (inQueue.isEmpty()) {
	        	outQueue.add(-1);
	        } else {
	        	outQueue.add(inQueue.poll());
	        }
	      } else if (str.equals("size")) {
	    	  outQueue.add(inQueue.size());
	      } else if (str.equals("empty")) {
	        if (inQueue.isEmpty()) {
	        	outQueue.add(1);
	        } else {
	        	outQueue.add(0);
	        }
	      } else if (str.equals("front")) {
	        if (inQueue.isEmpty()) {
	        	outQueue.add(-1);
	        } else {
	        	outQueue.add(inQueue.peek());
	        }
	      } else if (str.equals("back")) {
		        if (inQueue.isEmpty()) {
		        	outQueue.add(-1);
		        } else {
		        	outQueue.add(back);
		        }
		      } else {
	    	  inQueue.add(back = Integer.parseInt(str.substring(5)));
	      }
	    }
	    br.close();

	    while (outQueue.peek() != null) {
	      System.out.println(outQueue.poll());
	    }
	}
}