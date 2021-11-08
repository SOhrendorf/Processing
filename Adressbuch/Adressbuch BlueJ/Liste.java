 class Liste{
    Person pTest = new Person(1234, "02762/607080", "Musterstraße 7, 57482 Wenden", "Hans");
    Element eTest = new Element(pTest);
    Element anker;

    void setup() {
    }

    void add() {
        eTest.next = anker;
        anker = eTest;
    }
}