import java.util.Scanner;
 class Person {
  int kundennr;
  String telefonnr;
  String adresse;
  String name;

  public Person() {
    System.out.println("Kundennummer");
    Scanner iKdNr = new Scanner(System.in);
    kundennr = iKdNr.nextInt();
    System.out.println("Telefonnummer");
    Scanner iteleNr = new Scanner(System.in);
    telefonnr = iteleNr.nextLine();
    System.out.println("Adresse");
    Scanner iAdresse = new Scanner(System.in);
    adresse = iAdresse.nextLine();
    System.out.println("Name");
    Scanner iName = new Scanner(System.in);
    name = iName.nextLine();
  }
  
}