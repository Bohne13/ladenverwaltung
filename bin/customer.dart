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
  static void deleteCustomer() {
    String temp;
    if (printCustomers() == 1) {
      return;
    } else {
      print("Welcher Kunde soll gelöscht werden? (0-${customers[items.length - 1]._count}");
      int number = int.parse(stdin.readLineSync());
      print(
          "Sind Sie sicher, dass Sie \"${customers[number]._firstName} ${customers[number]._lastName}\" LÖSCHEN möchten? (Y/N)");
      do {
        temp = stdin.readLineSync().toUpperCase();
      } while (temp != "Y" && temp != "N");
      if (temp == "Y") {
        String firstName = customers[number]._firstName;
        String lastName = customers[number]._lastName;
        customers.removeAt(number);
        print("Der Kunde \"$firstName $lastName\" wurde gelöscht!");
        print("");
        printCustomers();
      } else {
        return;
      }
    }

  }
}
