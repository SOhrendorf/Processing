import java.util.Scanner;
//test
class Liste{
    Element anker;
    Element aktuell;

    public Liste(){
        menue(); 
    }

    void menue(){
        System.out.println("1) add Nutzer");
        System.out.println("2) alle Benutzer anzeigen");
        Scanner input = new Scanner(System.in);
        int auswahl = input.nextInt();

        if(auswahl == 1){
            Scanner iKdNr = new Scanner(System.in);
            int pKdNr = iKdNr.nextInt();
            Scanner iteleNr = new Scanner(System.in);
            String pTeleNr = iteleNr.nextString();
            Scanner iAdresse = new Scanner(System.in);
            String pAdresse = iAdresse.nextString();
            Scanner iName = new Scanner(System.in);
            String pName = iName.nextString();
            Person pPerson = new Person(pKdNr, pTeleNr, pAdresse, );
            add(pPerson);
        }else if(auswahl == 2){
            System.out.println("2");
        }
        else{
            return;
        }

    }

    void add(Person p) {
        Element e = new Element(p);
        e.next = anker;
        anker = e;
    }

    void toFirst(){
        aktuell = anker;  
     }
    void next(){
        if(hasAccess()){
            aktuell = aktuell.next;
        }
    }
    Person getContent(){
        return aktuell.person; 
     }

    boolean hasAccess(){
        if(aktuell == null){
            return false;
        }
        return true;
    }

    void alleAnzeigen(){
        toFirst();
        while(hasAccess()){
            Person p = getContent();
            System.out.print(p.name + " ");
            System.out.print(p.adresse + " ");
            System.out.print(p.kundennr + " ");
            System.out.println(p.telefonnr + " ");
            next();
        }

    }

    void suchenName(String pName){
        toFirst();
        while(aktuell.person.name != pName){
            next();
        }
        System.out.println("Kundennummer: " + aktuell.person.kundennr);
        System.out.println("Telefonnummer: " +aktuell.person.telefonnr);
        System.out.println("Name: " +aktuell.person.name);
        System.out.println("Adresse: " +aktuell.person.adresse);
    }

}