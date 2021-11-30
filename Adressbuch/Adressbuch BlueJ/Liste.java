import java.lang.management.GarbageCollectorMXBean;
import java.util.List;
import java.util.Scanner;

import javax.swing.text.html.HTMLDocument.HTMLReader.SpecialAction;

//test
public class Liste {
    Element anker;
    Element aktuell;

    public Liste() {
        menue();
    }

    public static void main(String[] args) {
        Liste l = new Liste();
    }

    void menue() {
        System.out.println("1) add Nutzer vorne");
        System.out.println("2) add Nutzer hinten");
        System.out.println("3) alle Benutzer anzeigen");
        System.out.println("4) ersten Benutzer löschen");
        System.out.println("5) letzten Benutzer löschen");
        System.out.println("9) exit");
        Scanner input = new Scanner(System.in);
        int auswahl = input.nextInt();

        if (auswahl == 1) {
            Person pPerson = new Person();
            add(pPerson);

        } else if (auswahl == 2) {
            Person pPerson = new Person();
            addBack(pPerson);

        } else if (auswahl == 3) {
            alleAnzeigen();

        } else if (auswahl == 4) {
            deleteFirst();

        } else if (auswahl == 5) {
            deleteLast();

        } else {
            return;
        }

    }

    void add(Person p) {
        Element e = new Element(p);
        e.next = anker;
        anker = e;
        menue();
    }

    void addBack(Person p) {
        if (lastElement() == null) {
            add(p);
        }
        Element e = new Element(p);
        Element elast = lastElement();
        elast.next = e;
        menue();
    }

    void deleteFirst() {
        if (listeEmpty() == false) {
            toFirst();
            next();
            if (aktuell != null) {
                Element e = aktuell;
                anker = e;
                menue();
            } else {
                System.out.println("Es gibt nur ein einziges Objekt; Sie dürfen ihren Anker nicht löschen!");
                menue();
            }
        } else {
            System.out.println("Ihre Liste ist leer, bitte erstellen sie zunächst ein Element");
            menue();
        }
    }

    void deleteLast() {
        if (listeEmpty() == false) {
            if (anker.next != null) {
                toFirst();
                Element e = aktuell;

                while (e.next.next != null) {
                    next();
                    e = aktuell;
                }

                e.next = null;
                menue();
            } else {
                System.out.println("Es gibt nur ein einziges Objekt; Sie dürfen ihren Anker nicht löschen!");
                menue();

            }
        } else {
            System.out.println("Ihre Liste ist leer, bitte erstellen sie zunächst ein Element");
            menue();
        }

    }

    void toFirst() {
        aktuell = anker;
    }

    Element lastElement() {
        Element e = null;
        toFirst();
        while (hasAccess()) {
            e = aktuell;
            next();
        }
        return e;
    }

    void next() {
        if (hasAccess()) {
            aktuell = aktuell.next;
        } else {
            System.out.println("next Element not avaibele");
        }
    }

    Person getContent() {
        return aktuell.person;
    }

    boolean hasAccess() {
        if (aktuell == null) {
            return false;
        }
        return true;
    }

    boolean listeEmpty() {
        return anker == null;
    }

    void alleAnzeigen() {
        toFirst();
        while (hasAccess()) {
            Person p = getContent();
            System.out.print(p.name + " ");
            System.out.print(p.adresse + " ");
            System.out.print(p.kundennr + " ");
            System.out.println(p.telefonnr + " ");
            next();
        }
        menue();
    }

    void suchenName(String pName) {
        toFirst();
        while (aktuell.person.name != pName) {
            next();
        }
        System.out.println("Kundennummer: " + aktuell.person.kundennr);
        System.out.println("Telefonnummer: " + aktuell.person.telefonnr);
        System.out.println("Name: " + aktuell.person.name);
        System.out.println("Adresse: " + aktuell.person.adresse);
    }

}