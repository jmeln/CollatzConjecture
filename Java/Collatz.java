//Author: Jarrett Melnick
//Program to find the top 10 Collatz sequences in a given range
import java.util.Scanner;

public class Collatz{
	public static void main(String [] args){
		//Change to modify the behavior of the program.
		Scanner Scan = new Scanner(System.in);

		System.out.print("Please provide the maximum value to be considered: ");
		long iterate;			//Max value to iterate
		iterate = Scan.nextLong();

		number[] result = new number[10]; 

		for(int i = 0; i < 10; i++){
			result[i] = new number();
		}
        
        System.out.println("Calculating...");
		for(long i = 2; i <= iterate; i++){
			long curCollatz = collatzConjecture(i);
            //System.out.println(i);
			if((curCollatz > result[9].collatzVal) && !(hasCollatzNumber(result, curCollatz))){
				number num = new number(i, curCollatz);
				result[9] = num;
				//System.out.println("SORTING...");
				result = sorter(result);
			}
		}
		//Prints the top 10 numbers with the largest collatz sequence.
		result = sorter(result);
        System.out.println("Building Results...");
		for(int i = 0; i < 10; i++){
			System.out.println(i+1 + " is " + result[i].identity + 
				" and has a collatz conjecture of " + result[i].collatzVal);
		}
	}
	private static long collatzConjecture(long val){
		//Calculates the length of the Collatz sequence for a given number.
		long counter = 0;
		while(val > 1){
			//System.out.println(val);
			val = (val % 2 == 1) ? (3*val+1) : (val/2);
			counter++;
		}
		return counter;
	}
	private static boolean hasCollatzNumber(number num[], long val){
		//Determines if the given array num has a number with a Collatz sequence of length val.
		for(int i = 0; i < 10; i++){
			if(num[i].collatzVal == val)
				return true;
		}
		return false;
	}
	private static number[] sorter(number num[]){
		//Sorts the array by the length of the collatz sequence
		boolean sorted = false;
		while(!sorted){
			sorted = true;

			for(int i = 1; i < 10 ; i++){
				if(num[i].collatzVal > num[i-1].collatzVal){
					number temp = num[i-1];
					num[i-1] = num[i];
					num[i] = temp;
					sorted = false;
				}
				/*else if(num[i].collatzVal == num[i-1].collatzVal){
					number temp = num[i-1];
					num[i-1] = num[i];
					num[i] = temp;
					sorted = false;
				}*/
			}
		}
		return num;
	}
}
class number{
	//Class to store the length of the Collatz value.
	public long identity = 0;		//Number's Identity
	public long collatzVal = 0;		//Length of Collatz sequence
	public number(){
		identity = 0;
		collatzVal = 0;
	}
	public number(long ident, long colVal){
		//Full constructor
		identity = ident;
		collatzVal = colVal;
	}
	public long getColatzVal(){
		//Returns Collatz sequence length
		return collatzVal;
	}
}
