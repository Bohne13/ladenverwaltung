part of finance;

class Customer {
  String _firstName;
  String _lastName;
  double _account = 0.0;
  int _count;

  static List<Customer> _customers = [];

  List<Customer> get customers => _customers;

  //set count(int count) {
  //  _count = count;
  //}

  Customer(this._firstName, this._lastName, this._account, this._count);

  static int setCount() {
    int tempCount = _customers[_customers.length - 1]._count;
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
    if (_customers.length == 0) {
      _customers.add(new Customer(firstName, lastName, account, 0));
    } else {
      _customers
          .add(new Customer(firstName, lastName, account, Customer.setCount()));
    }
  }

  static int printCustomers() {
    if (_customers.length == 0) {
      print("Es ist aktuell kein Kunde in der Liste.");
      print("");
      return 1;
    } else {
      for (int i = 0; i < _customers.length; i++) {
        print(
            "${_customers[i]._count}: ${_customers[i]._firstName} ${_customers[i]._lastName}: ${_customers[i]._account}€");
      }
    }
    print("");
    return 0;
  }

  // TODO: The function isn't complete, it actually don't work
  static void deleteCustomer(List<Customer> _customers) {
    int returnValue = printCustomers();
    String yesNo;
    if (returnValue == 1) {
      return;
    } else if (returnValue == 0) {
      print(
          "Welcher Kunde soll gelöscht werden? (0-${_customers.length - 1})?");
      int deleteNumber = int.parse(stdin.readLineSync());
      print(
          "Sind sie sicher, den Kunden ${_customers[deleteNumber]._firstName} ${_customers[deleteNumber]._lastName} zu löschen? (Y/N)");
      // TODO: yesNo schould be prooft if input is a String
      do {
        yesNo = stdin.readLineSync().toUpperCase();
      } while (yesNo != "Y" && yesNo != "N");
      if (yesNo == "Y") {
        _customers.removeAt(deleteNumber);
      } else {
        return;
      }
    }
  }

  static int selectCustomer() {
    int returnValue = printCustomers();
    if (returnValue == 1) {
      return 1;
    } else if (returnValue == 0) {
      print("Welcher Kunde soll ausgewählt werden? (0-x)");
      int selectNumber = int.parse(stdin.readLineSync());
      return selectNumber;
    }
  }
}
