package exam;

import java.util.*;

public class ex1181 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		int n = sc.nextInt();

		sc.nextLine();

		String[] strArr = new String[n];

		for (int i = 0; i < n; i++) {
			strArr[i] = sc.nextLine();
		}

		sc.close();

		Arrays.sort(strArr);

		for (int j = 1; j <= 50; j++) {
			for (int i = 0; i < n; i++) {
				if ((i == n - 1 || !strArr[i].equals(strArr[i + 1])) && (strArr[i].length() == j)) {
					System.out.println(strArr[i]);
				}
			}
		}
	}
}