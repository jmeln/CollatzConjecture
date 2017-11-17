//Author: Jarrett Melnick
//Program to find the numbers with the largest Collatz sequence in a range.
#include <iostream>

using namespace std;

//Main struct to keep track of numbers and thier Collatz sequence length.
struct number{
	long identity = 0;
	long collatzVal = 0;
};

long collatzConjecture(long num);
void sorter(number num[10]);

int main(){

	//Change this number to change the range. It should be the largest nubmer considered.
	long iterate = 13;
	number result[10];

	//Runs the collatz conjecture on each number in the given range.
	for(long i = iterate; i > 1; i--){
		long curCollatz = collatzConjecture(i);
		if(curCollatz > result[9].collatzVal){
			result[9].identity = i;
			result[9].collatzVal = curCollatz;
		}
		sorter(result);
	}
	sorter(result);
	for(int i = 0; i < 10; i++){
		printf("%i is %d and has a collatz conjecture of %d.\n", i+1, result[i].identity, result[i].collatzVal);
	}
}
long collatzConjecture(long num){
	//Function to perform a collatz conjecture on a given value.
	long counter = 0;
	while(num > 1){
		num = ((num % 2 == 1) ? (3*num+1): (num/2));
		counter++; 
	}
	return counter;
}
void sorter(number num[]){
	//Function to sort the array of Numbers first by size of collatz sequence and then by 
	//identity.
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
			else if(num[i].collatzVal == num[i-1].collatzVal && num[i].identity > num[i-1].identity){
				number temp = num[i-1];
				num[i-1] = num[i];
				num[i] = temp;
				sorted = false;
			}
		}
	}
}