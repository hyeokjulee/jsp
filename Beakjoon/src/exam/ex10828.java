package exam;

import java.util.*;
import java.io.*;

public class ex10828 {
	public static void main(String[] args) throws IOException {
		Stack<Integer> stack = new Stack<>();
	    Queue<Integer> queue = new LinkedList<>();
	    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	    int n = Integer.parseInt(br.readLine());
	    String str;
	    for (int i = 0; i < n; i++) {
	      str = br.readLine();
	      if (str.equals("pop")) {
	        if (stack.empty()) {
	          queue.add(-1);
	        } else {
	          queue.add(stack.pop());
	        }
	      } else if (str.equals("size")) {
	        queue.add(stack.size());
	      } else if (str.equals("empty")) {
	        if (stack.empty()) {
	          queue.add(1);
	        } else {
	          queue.add(0);
	        }
	      } else if (str.equals("top")) {
	        if (stack.empty()) {
	          queue.add(-1);
	        } else {
	          queue.add(stack.peek());
	        }
	      } else {
	        stack.push(Integer.parseInt(str.substring(5)));
	      }
	    }
	    br.close();

	    while (queue.peek() != null) {
	      System.out.println(queue.poll());
	    }
	}
}