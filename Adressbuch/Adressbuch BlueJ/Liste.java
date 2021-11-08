 class Liste{
    Element anker;

    void setup() {
    }

    void add(Person p) {
        Element e = new Element(p);
        e.next = anker;
        anker = e;
    }
}