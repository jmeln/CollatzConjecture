//Author: Jarrett Melnick
//Program to find the top 10 Collatz sequences in a given range
public class Collatz{
	public static void main(String [] args){
		//long iterate = Long.MAX_VALUE;
		long iterate = 5000000000;			//Max value to iterate
		number[] result = new number[10]; 

		for(int i = 0; i < 10; i++){
			result[i] = new number();
		}

		for(long i = iterate; i > 1; i--){
			long curCollatz = collatzConjecture(i);
			if(curCollatz > result[9].collatzVal){
				number num = new number(i, curCollatz);
				result[9] = num;
				result = sorter(result);
			}
		}
		//Prints the top 10 numbers with the largest collatz sequence.
		result = sorter(result);
		for(int i = 0; i < 10; i++){
			System.out.println(i+1 + " is " + result[i].identity + 
				" and has a collatz conjecture of " + result[i].collatzVal);
		}
	}
	private static long collatzConjecture(long val){
		//Calculates the length of the Collatz sequence for a given number.
		long counter = 0;
		while(val > 1){
			val = ((val % 2) == 1) ? (3*val+1): (val/2);
			counter++;
		}
		return counter;
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
				else if(num[i].collatzVal == num[i-1].collatzVal){
					number temp = num[i-1];
					num[i-1] = num[i];
					num[i] = temp;
					sorted = false;
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
