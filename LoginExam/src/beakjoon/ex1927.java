package beakjoon;

import java.io.*;
import java.util.*;

class ex1927 {
	public static void main(String[] args) throws IOException {
	    PriorityQueue<Integer> minHeap = new PriorityQueue<>();
	    Queue<Integer> outQueue = new LinkedList<>();

	    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	    int n = Integer.parseInt(br.readLine());
	    int in;

	    for (int i = 0; i < n; i++) {
	      in = Integer.parseInt(br.readLine());
	      if (in == 0) {
	        if (minHeap.isEmpty()) {
	          outQueue.add(0);
	        } else {
	          outQueue.add(minHeap.poll());
	        }
	      } else {
	        minHeap.add(in);
	      }
	    }
	    br.close();

	    while (outQueue.peek() != null) {
	      System.out.println(outQueue.poll());
	    }
	  }
}