class Contactt {
  String name;
  String phone;

  Contactt(this.name, this.phone);
}

class AddContacts {
  List<Contactt> contactList = [
    Contactt("Ilhomjon", "+998945096336"),
    Contactt("Javlon aka", "+998901234567"),
    Contactt("Doniyor", "+9989300000000"),
    Contactt("Mansurbek", "+998914747474"),
    Contactt("Sanjar aka", "+9989341000140"),
    Contactt("Sardorbek", "+99896547841"),
    Contactt("Shaxriyor", "+998911122767"),
    Contactt("Ucell Call Centre", "8123"),
    Contactt("PDP Call Centre", "+998787774747"),
    Contactt("My number", "+998930000342"),
  ];

  set setContact(Contactt contact) {

     contactList.add(contact);

  }

  get getContact => contactList;
}
