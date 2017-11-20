using System;

public class Collatz{
 	public staic void Main(){
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
		result = sorter(result);
		for(int i = 0; i < 10; i++){
			Console.WriteLine(i+1 + " is " + result[i].identity + 
				" and has a collatz conjecture of " + result[i].collatzVal);
		}
 	}
 	public static long CollatzConjecture(long num){
		long counter = 0;
		while(val > 1){
			val = ((val % 2) == 1) ? (3*val+1): (val/2);
			counter++;
		}
		return counter;
 	}
 		private static number[] sorter(number num[]){
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
				else if(num[i].collatzVal == num[i-1].collatzVal && num[i].identity > num[i-1].identity){
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
	public long identity = 0;
	public long collatzVal = 0;
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
