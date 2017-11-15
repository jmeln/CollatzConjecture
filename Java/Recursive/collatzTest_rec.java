import java.util.Scanner;

public class collatzTest{
	public static void main(String [] args){
		Scanner scan = new Scanner(System.in);
		long val = scan.nextLong();
		long iterate = val;
		long counter = 0;
		while(iterate > 1){
			iterate = ((iterate % 2) == 1) ? (3*iterate+1): (iterate/2);
			counter++;
		}
		System.out.println(val + " has " + counter + " terms.");
	}
}