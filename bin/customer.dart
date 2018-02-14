part of finance;

class Customer {
  String _firstName;
  String _lastName;
  double _account = 0.0;
  int _count;

  // int get count => _count;
  //double get account => _account;

  //set count(int count) {
  //  _count = count;
  //}

  Customer(this._firstName, this._lastName, this._account, this._count);

  static int setCount() {
    int tempCount = customers[customers.length - 1]._count;
    return tempCount + 1;
  }

  // TODO: Exception handling by fo all input streams missing
  static void newCustomer() {
    print("Vorname:");
    String firstName = stdin.readLineSync();
    print("Nachname:");
    String lastName = stdin.readLineSync();
    print("Kontostand:");
    double account = double.parse(stdin.readLineSync());
    if (customers.length == 0) {
      customers.add(new Customer(firstName, lastName, account, 0));
    } else {
      customers
          .add(new Customer(firstName, lastName, account, Customer.setCount()));
    }
  }

  static int printCustomers() {
    if (customers.length == 0) {
      print("Es ist aktuell kein Kunde in der Liste.");
      print("");
      return 1;
    } else {
      for (int i = 0; i < customers.length; i++) {
        print(
            "${customers[i]._count}: ${customers[i]._firstName} ${customers[i]._lastName}: ${customers[i]._account}€");
      }
    }
    print("");
    return 0;
  }

  // TODO: The function isn't complete, it actually don't work
  static void deleteCustomer(List<Customer> customers) {
    //int tmp = 0;
    int returnValue = printCustomers();
    String yesNo;
    if (returnValue == 1) {
      return;
    } else if (returnValue == 0) {
      print("Welcher Kunde soll gelöscht werden? (0-${customers.length - 1})?");
      int deleteNumber = int.parse(stdin.readLineSync());
      print(
          "Sind sie Sicher, den Kunden ${customers[deleteNumber]._firstName} ${customers[deleteNumber]._lastName} löschen möchten? (Y/N)");
      do {
        yesNo = stdin.readLineSync().toUpperCase();
      } while (yesNo != "Y" && yesNo != "N");
      if (yesNo == "Y") {
        customers.removeAt(deleteNumber);
      } else {
        return;
      }
    }
  }
}
