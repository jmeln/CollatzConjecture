import java.util.Scanner;

public class scanTest{
    public static void main(String[] args){
        Scanner Scan = new Scanner(System.in);

        System.out.print("Please provide the max: ");
        long iterate;
        iterate = Scan.nextLong();

        System.out.println("You Entered: " + iterate);
    }
}
