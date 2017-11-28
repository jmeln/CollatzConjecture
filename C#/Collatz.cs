//Author: Jarrett Melnick
//Program to perform a Collatz sequence on a given range and return the top 10 numbers
//with the largest collatz sequences.

using System;

public class Collatz{
 	public static void Main(){
 		long iterate = 5000000000;			//Max number considered. Change this to change the range.
		number[] result = new number[10]; 

		for(int i = 0; i < 10; i++){
			result[i] = new number();
		}
		//Performs collatz sequence stating from the max number.
		for(long i = iterate; i > 1; i--){
			long curCollatz = CollatzConjecture(i);
			if(curCollatz > result[9].collatzVal){
				number num = new number(i, curCollatz);
				result[9] = num;
				result = sorter(result);
			}
		}
		//Prints the top 10 numbers with the largest collatz values.
		result = sorter(result);
		for(int i = 0; i < 10; i++){
			Console.WriteLine(i+1 + " is " + result[i].identity + 
				" and has a collatz conjecture of " + result[i].collatzVal);
		}
 	}
 	public static long CollatzConjecture(long val){
 	//Calculates the length of a collatz sequence for a given number
		long counter = 0;
		while(val > 1){
			val = ((val % 2) == 1) ? (3*val+1): (val/2);
			counter++;
		}
		return counter;
 	}
 	private static number[] sorter(number[] num){
 		//Sorts the array of number objects by largest sequence.
		bool sorted = false;
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
	//Class to store collatz sequence data.
	public long identity = 0;		//Number's identity
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
		//Returns collatz sequence value
		return collatzVal;
	}
}
