package exam;

import java.util.*;

public class ex1931 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt();
		int[][] arr = new int[n][2];
		for (int i = 0; i < n; i++) {
			arr[i][0] = sc.nextInt();
			arr[i][1] = sc.nextInt();
		}
		sc.close();

		Arrays.sort(arr, (o1, o2) -> {
			return o1[1] != o2[1] ? o1[1] - o2[1] : o1[0] - o2[0];
		});

		int end = 0;
		int cnt = 0;

		for (int i = 0; i < n; i++) {
			if (arr[i][0] >= end) {
				cnt++;
				end = arr[i][1];
			}
		}

		System.out.println(cnt);
	}
}