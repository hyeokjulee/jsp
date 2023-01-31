package exam;

import java.io.*;
import java.util.StringTokenizer;

public class ex13305 {
	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st;

		int n = Integer.parseInt(br.readLine());
		int[] arr1 = new int[n - 1];
		int[] arr2 = new int[n];
		st = new StringTokenizer(br.readLine());
		for (int i = 0; i < n - 1; i++) {
			arr1[i] = Integer.parseInt(st.nextToken());
		}
		st = new StringTokenizer(br.readLine());
		for (int i = 0; i < n; i++) {
			arr2[i] = Integer.parseInt(st.nextToken());
		}
		br.close();

		for (int i = 1; i < n; i++) {
			arr2[i] = arr2[i - 1] < arr2[i] ? arr2[i - 1] : arr2[i];
		}

		int minCost = 0;
		for (int i = 0; i < n - 1; i++) {
			minCost += arr1[i] * arr2[i];
		}

		System.out.println(minCost);
	}
}