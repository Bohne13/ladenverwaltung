part of finance;

class Item {
  String _name;
  double _price = 0.0;
  int _count;

  static List<Item> _items = [];

  List<Item> get items => _items;

  //set items(List<Item> items) {
  //  _items = items;
  //}


  Item(this._name, this._price, this._count);

  static int setCount() {
    int tmpCount = _items[_items.length - 1]._count;
    return tmpCount + 1;
  }

  // TODO: Exception handling by fo all input streams missing
  static void newItem() {
    print("Artikel-Name:");
    String name = stdin.readLineSync();
    print("Artikel-Preis:");
    //String tmp = stdin.readLineSync();
    double price = double.parse(stdin.readLineSync());
    if (_items.length == 0) {
      _items.add(new Item(name, price, 0));
    } else {
      _items.add(new Item(name, price, Item.setCount()));
    }
  }

  static int printItem() {
    if (_items.length == 0) {
      print("Es ist aktuell kein Artikel in der Liste.");
      print("");
      return 1;
    } else {
      for (int j = 0; j < _items.length; j++) {
        print("${_items[j]._count}: ${_items[j]._name} ${_items[j]._price}€");
      }
    }
    print("");
    return 0;
  }

  static void deleteItem(List<Item> items) {
    int returnValue = printItem();
    String yesNo;
    if (returnValue == 1) {
      return;
    } else if (returnValue == 0) {
      print("Welcher Artikel soll gelöscht werden? (0-${})?"); // TODO: last number should be the last number which is in List items
      int deleteNumber = int.parse(stdin.readLineSync());
      print(
          "Sind Sie sicher, den Artikel ${items[deleteNumber]._name} zu löschen? (Y/N)");
      // TODO: yesNo should be proofed if input is a String
      do {
        yesNo = stdin.readLineSync().toUpperCase();
      } while (yesNo != "Y" && yesNo != "N");
      if (yesNo == "Y") {
        items.removeAt(deleteNumber);
      } else {
        return;
      }
    }
  }
}