package beakjoon;

import java.util.*;

public class ex10870 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
    System.out.print(Fibonacci(sc.nextInt()));
    sc.close();
	}
	
	public static int Fibonacci(int n)
	{
		if(n == 0)
			return 0;
		
		if(n == 1 || n == 2)
			return 1;
		
		else 
			return Fibonacci(n - 1) + Fibonacci(n - 2);
	}
}