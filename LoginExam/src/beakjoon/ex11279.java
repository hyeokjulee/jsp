package beakjoon;

import java.io.*;
import java.util.*;

public class ex11279 {
	public static void main(String[] args) throws IOException {
		PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
		Queue<Integer> outQueue = new LinkedList<>();

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int n = Integer.parseInt(br.readLine());
		int in;

		for (int i = 0; i < n; i++) {
			in = Integer.parseInt(br.readLine());
			if (in == 0) {
				if (maxHeap.isEmpty()) {
					outQueue.add(0);
				} else {
					outQueue.add(maxHeap.poll());
				}
			} else {
				maxHeap.add(in);
			}
		}
		br.close();

		while (outQueue.peek() != null) {
			System.out.println(outQueue.poll());
		}
	}
}