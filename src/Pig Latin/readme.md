import java.util.Scanner;

class Main {
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);
    System.out.println("Enter a string: ");
    String word = scan.nextLine();
    word = word.toLowerCase();
    int count = word.length();
    String firstLetter = word.substring(0,1);
    String lastPart = word.substring(1);
    String result = lastPart + firstLetter + "ay";
    System.out.println(result);
    scan.close();
  }
}
