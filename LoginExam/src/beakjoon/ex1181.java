package beakjoon;

import java.util.*;

public class ex1181 {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		int n = sc.nextInt();
		String[] arr = new String[n];
		
		for (int i = 0; i < n; i++) {
			arr[i] = sc.nextLine();
		}
		
		Arrays.sort(arr, (s1, s2) -> s1.length() - s2.length());
		Arrays.sort(arr, Comparator.comparing(String::length));
		
		Arrays.sort(arr);

		for (int i = 0; i < n; i++) {
			System.out.println(arr[i]);
		}
		
		sc.close();
	}
}