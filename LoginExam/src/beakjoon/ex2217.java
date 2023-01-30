package beakjoon;

import java.io.*;
import java.util.*;

public class ex2217 {
	public static void main(String[] args) throws IOException {
		PriorityQueue<Integer> minHeap = new PriorityQueue<>();
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int n = Integer.parseInt(br.readLine());
		for (int i = 0; i < n; i++) {
			minHeap.add(Integer.parseInt(br.readLine()));
		}
		br.close();

		PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
		for (int i = 0; i < n; i++) {
			maxHeap.add((n - i) * minHeap.poll());
		}

		System.out.println(maxHeap.peek());
	}
}