//Author: Jarrett Melnick
//Program to find the numbers with the largest Collatz sequence in a range.
#include <iostream>
#include <stdio.h>

using namespace std;

//Main struct to keep track of numbers and thier Collatz sequence length.
struct number{
	number(): identity(0), collatzVal(0){}
	long identity;
	long collatzVal;
};

long collatzConjecture(long num, long collatz);
bool hasCollatzNumber(number num[10], long val);
void sorter(number num[10], bool seqSort);

int main(){

	//Change this number to change the range. It should be the largest nubmer considered.
	cout << "Please enter the largest number to be considered: ";
	long iterate;
	cin >> iterate;

	number result[10];
    cout << "Calculating Results..." << endl;
	//Runs the collatz conjecture on each number in the given range.
	for(long i = 2; i <= iterate; i++){
		long curCollatz = collatzConjecture(i,0);
		if((curCollatz > result[9].collatzVal) && !(hasCollatzNumber(result, curCollatz))){
			result[9].identity = i;
			result[9].collatzVal = curCollatz;
		}
		sorter(result, true);
	}
	sorter(result, true);
	cout << "SORTED BY SEQUENCE LENGTH" << endl;
	for(int i = 0; i < 10; i++){
		printf("%ld has a collatz conjecture of %ld.\n", result[i].identity, result[i].collatzVal);
	}
	sorter(result, false);
	cout << "SORTED BY INTEGER SIZE" << endl;
	for(int i = 0; i < 10; i++){
		printf("%ld has a collatz conjecture of %ld.\n", result[i].identity, result[i].collatzVal);
	}
}
long collatzConjecture(long num, long collatz){
	//Function to perform a collatz conjecture on a given value.
	if(num <= 1){
		return collatz;
	}
	else{
		return ((num % 2 == 1) ? (collatzConjecture(3*num+1,collatz+1)): (collatzConjecture(num/2,collatz+1)));
	}
}
bool hasCollatzNumber(number num[], long val){
	//Determines if the given array num has a number with a Collatz sequence of length val.
	for(int i = 0; i < 10; i++){
		if(num[i].collatzVal == val)
			return true;
	}
	return false;
}
void sorter(number num[], bool seqSort){
	//Function to sort the array of Numbers first by size of collatz sequence and then by 
	//identity.
	bool sorted = false;
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
}

