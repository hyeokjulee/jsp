package exam;

import java.io.*;
import java.util.*;

class ex11286 {
	public static void main(String[] args) throws IOException {
		PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
		PriorityQueue<Integer> minHeap = new PriorityQueue<>();
		Queue<Integer> outQueue = new LinkedList<>();
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int n = Integer.parseInt(br.readLine());
		int in;
		for (int i = 0; i < n; i++) {
			in = Integer.parseInt(br.readLine());
			if (in < 0) {
				maxHeap.add(in);
			} else if (in > 0) {
				minHeap.add(in);
			} else {
				if (minHeap.isEmpty() && maxHeap.isEmpty()) {
					outQueue.add(0);
				} else if (maxHeap.isEmpty()) {
					outQueue.add(minHeap.poll());
				} else if (minHeap.isEmpty()) {
					outQueue.add(maxHeap.poll());
				} else {
					if (-maxHeap.peek() > minHeap.peek()) {
						outQueue.add(minHeap.poll());
					} else {
						outQueue.add(maxHeap.poll());
					}
				}
			}
		}
		br.close();

		while (outQueue.peek() != null) {
			System.out.println(outQueue.poll());
		}
	}
}