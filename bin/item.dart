part of finance;

class Item {
  String _name;
  double _price = 0.0;
  int _count;

  //int get count => _count;

  //set count(int count) {
   // _count = count;
  //}

  Item(this._name, this._price, this._count);

  static int setCount() {
    int tmpCount = items[items.length - 1]._count;
    return tmpCount + 1;
  }

  // TODO: Exception handling by fo all input streams missing
  static void newItem() {
    print("Artikel-Name:");
    String name = stdin.readLineSync();
    print("Artikel-Preis:");
    //String tmp = stdin.readLineSync();
    double price = double.parse(stdin.readLineSync());
    if (items.length == 0) {
      items.add(new Item(name, price, 0));
    } else {
      items.add(new Item(name, price, Item.setCount()));
    }
  }

  static int printItem() {
    if (items.length == 0) {
      print("Es ist aktuell kein Artikel in der Liste.");
      print("");
      return 1;
    } else {
      for (int j = 0; j < items.length; j++) {
        print("${items[j]._count}: ${items[j]._name} ${items[j]._price}€");
      }
    }
    print("");
    return 0;
  }

  // TODO: It's not finisched
  static void deleteItem() {
    String temp;
    if (printItem() == 1) {
      return;
    }
    print("Welcher Artikel soll gelöscht werden? (0-${items[items.length - 1]._count}");
  }
}