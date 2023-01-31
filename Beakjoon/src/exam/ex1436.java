package exam;

import java.util.*;

public class ex1436 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		sc.close();
		int cnt = 0;
		int num = 0;
		int[] arr = new int[n];

		while (cnt < n) {
			num++;
			if (Integer.toString(num).contains("666")) {
				arr[cnt++] = num;
			}
		}

		System.out.println(arr[n - 1]);
	}
}