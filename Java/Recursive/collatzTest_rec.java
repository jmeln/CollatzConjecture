import java.util.Scanner;

public class collatzTest_rec{
	public static void main(String [] args){
		int c = 0;
		Scanner scan = new Scanner(System.in);
		do{
		long val = scan.nextLong();
		long counter = 0;

		counter = Collatz(val,0);
		System.out.println(val + " has " + counter + " terms.");
		System.out.println("Continue?");
		c = scan.nextInt();
		}while(c != 0);
	}
	public static long Collatz(long num, long collatz){
		if(num <= 1){
			return collatz;
		}
		else{
			return ((num % 2 == 1) ? (Collatz(3*num+1,collatz+1)): (Collatz(num/2,collatz+1)));
		}
		/*if(num <= 1){
			return 1;
			//return collatz;
		}
		else{
			long collatz = 0;
			System.out.println(collatz);
			if((num % 2) == 1)
				collatz = Collatz((3*num+1), collatz);
			else if((num % 2) == 0)
				collatz = Collatz((num/2),collatz);
			return collatz;*/
		//}
	}
}