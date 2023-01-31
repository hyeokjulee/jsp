package exam;

import java.util.Scanner;

class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int k = sc.nextInt();
		int[] inArr = new int[(int) (Math.pow(2, k) - 1)];
		for (int i = 0; i < inArr.length; i++) {
			inArr[i] = sc.nextInt();
		}
		sc.close();

		int outOutArr[][] = new int[k][];
		for (int i = 0; i < k; i++) {
			outOutArr[i] = new int[(int) (Math.pow(2, i + 1) - 1)];
			for (int j = 0; j < outOutArr[i].length; j++) {
				outOutArr[i][j] = inArr[(int) (Math.pow(2, k - 1 - i) * (j + 1) - 1)];
				inArr[(int) (Math.pow(2, k - 1 - i) * (j + 1) - 1)] = 0;
			}
		}

		for (int i = 0; i < k; i++) {
			for (int j = 0; j < outOutArr[i].length; j++) {
				if (outOutArr[i][j] != 0) {
					System.out.print(outOutArr[i][j] + " ");
				}
			}
			System.out.println();
		}
	}
}