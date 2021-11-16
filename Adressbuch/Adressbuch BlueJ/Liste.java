class Liste{
    Element anker;
    Element aktuell;

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