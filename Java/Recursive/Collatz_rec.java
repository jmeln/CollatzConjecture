//Author: Jarrett Melnick
//Program to find the top 10 Collatz sequences in a given range
import java.util.Scanner;

public class Collatz_rec{
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
        
		for(long i = 2; i <= iterate; i++){
			long curCollatz = collatzConjecture(i,0);
            //System.out.println(curCollatz);
			if((curCollatz > result[9].collatzVal) && !(hasCollatzNumber(result, curCollatz))){
				number num = new number(i, curCollatz);
				result[9] = num;
				//System.out.println("SORTING...");
				result = sorter(result, true);
			}
		}
		//Prints the top 10 numbers with the largest collatz sequence.
		result = sorter(result, true);
        System.out.println("SORTING BY SEQUENCE LENGTH");
		for(int i = 0; i < 10; i++){
			System.out.println(result[i].identity + 
				" has a collatz conjecture of " + result[i].collatzVal);
		}
		System.out.println("SORTING BY INTEGER LENGTH");
		result = sorter(result, false);
		for(int i = 0; i < 10; i++){
			System.out.println(result[i].identity + 
				" has a collatz conjecture of " + result[i].collatzVal);
		}
	}
	private static long collatzConjecture(long val, long counter){
		//Calculates the length of the Collatz sequence for a given number.
		if(val <= 1){
			return counter;
		}
		else if(val % 2 == 0){
			return collatzConjecture((val/2), (counter+1));
		}
		else{
			return collatzConjecture((3*val+1),(counter+1));
		}
	}
	private static boolean hasCollatzNumber(number num[], long val){
		//Determines if the given array num has a number with a Collatz sequence of length val.
		for(int i = 0; i < 10; i++){
			if(num[i].collatzVal == val)
				return true;
		}
		return false;
	}
	private static number[] sorter(number num[], boolean seqSort){
		//Sorts the array by the length of the collatz sequence
		boolean sorted = false;
		while(!sorted){
			sorted = true;
			if(seqSort){
				for(int i = 1; i < 10 ; i++){
					if(num[i].collatzVal > num[i-1].collatzVal){
						number temp = num[i-1];
						num[i-1] = num[i];
						num[i] = temp;
						sorted = false;
					}
				}
			}
			else{
				for(int i = 1; i < 10 ; i++){
					if(num[i].identity > num[i-1].identity){
						number temp = num[i-1];
						num[i-1] = num[i];
						num[i] = temp;
						sorted = false;
					}
				}
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
