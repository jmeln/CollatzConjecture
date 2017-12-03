//Author: Jarrett Melnick
//Program to return the top 10 numbers with the largest Collatz sequence in a given range
using System;

public class Collatz{
 	public static void Main(){
		Console.Write("Enter the maximum value to be considered: ");
		long iterate = Convert.ToInt64(Console.ReadLine());	

		number[] result = new number[10]; 

		for(int i = 0; i < 10; i++){
			result[i] = new number();
		}

		for(long i = 2; i <= iterate; i++){
			long curCollatz = CollatzConjecture(i,0);
			if((curCollatz > result[9].collatzVal) && !(hasCollatzNumber(result, curCollatz))){
				number num = new number(i, curCollatz);
				result[9] = num;
				result = sorter(result);
			}
		}
		//Prints the top 10 numbers with the largest Collatz sequences.
		result = sorter(result);
		for(int i = 0; i < 10; i++){
			Console.WriteLine(i+1 + " is " + result[i].identity + 
				" and has a collatz conjecture of " + result[i].collatzVal);
		}
 	}
 	public static long CollatzConjecture(long val, long collatz){
 		//Function to calculate the length of a given number's collatz sequence.
 		string binNumber = Convert.ToString(val, 2);
		if(val <= 1){
			return collatz;
		}
		else{
			return (binNumber.Trim().EndsWith("1")) ? (CollatzConjecture(3*val+1,collatz+1)): (CollatzConjecture(val/2,collatz+1));
		}
 	}
 	 	private static bool hasCollatzNumber(number[] num, long val){
		//Determines if the given array num has a number with a Collatz sequence of length val.
 		for(int i = 0; i < 10; i++){
 			if(num[i].collatzVal == val)
 			return true;
 		}
 		return false;
 	}
 	private static number[] sorter(number[] num){
 		//Sorts the array by the number with the largest Collatz sequence
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
			}
		}
		return num;
	}

}
class number{
	//Class to hold data for Collatz sequence
	public long identity = 0;		//Identity of number
	public long collatzVal = 0;		//Length of Collatz value
	public number(){
		identity = 0;
		collatzVal = 0;
	}
	public number(long ident, long colVal){
		//Full constructor with provided identity and collatz value.
		identity = ident;
		collatzVal = colVal;
	}
	public long getColatzVal(){
		//Returns collatz value
		return collatzVal;
	}
}
