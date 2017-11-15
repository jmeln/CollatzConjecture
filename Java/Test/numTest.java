public class numTest{
	public static void main(String [] args){
	number[] num = new number[10];
	for(int i = 0; i < 10; i++)
		num[i] = new number();

	System.out.println(num[0].collatzVal);
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
}