//Author: Jarrett Melnick
//Program to find the top 10 numbers with the largest Collatz value
public class Collatz_rec{
	public static void main(String [] args){
		//long iterate = Long.MAX_VALUE;
		long iterate = 5000000000;		//Max value to be checked. Change this number to change the range
		number[] result = new number[10]; 

		for(int i = 0; i < 10; i++){
			result[i] = new number();
		}

		for(long i = iterate; i > 1; i--){
			long curCollatz = collatzConjecture(i,0);
			if(curCollatz > result[9].collatzVal){
				number num = new number(i, curCollatz);
				result[9] = num;
				result = sorter(result);
			}
		}
		//Prints the top 10 numbers with the longest Collatz seqences
		result = sorter(result);
		for(int i = 0; i < 10; i++){
			System.out.println(i+1 + " is " + result[i].identity + 
				" and has a collatz conjecture of " + result[i].collatzVal);
		}
	}
	private static long collatzConjecture(long num, long collatz){
		//Performs the Collatz Conjecture on the given number
		if(num <= 1){
			return collatz;
		}
		else{
			return ((num % 2 == 1) ? (collatzConjecture(3*num+1,collatz+1)): (collatzConjecture(num/2,collatz+1)));
		}
	}
	private static number[] sorter(number num[]){
	//Sorts the array by largest Collatz seqence
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
				else if(num[i].collatzVal == num[i-1].collatzVal && num[i].identity){
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
	//Class to store the Collatz data
	public long identity = 0;		//Number's identity
	public long collatzVal = 0;		//Length of Collatz Sequence.
	public number(){
		identity = 0;
		collatzVal = 0;
	}
	public number(long ident, long colVal){
		identity = ident;
		collatzVal = colVal;
	}
	public long getColatzVal(){
		return collatzVal;
	}
}
