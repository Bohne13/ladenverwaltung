library finance;

import 'dart:io';

part 'customer.dart';
part 'item.dart';

String start() {
  print("Wählen Sie eine Option:");
  print(
      "(NC) New Customer, (Qu)ite, (PC) print customer, (NI) new item,\n(PI) print item, (DC) delete customer, (DI) delete item, (DA) delete all,\n");
  return stdin.readLineSync().toUpperCase();
}

void deleteAll(List<Customer> customers, List<Item> items) {
  String temp = "";
  print("Sind Sie sicher, alle KUNDEN und alle ARTIKEL zu löschen? (Y/N)");
  do {
    temp = stdin.readLineSync().toUpperCase();
  } while (temp != "Y" && temp != "N");
  if (temp == "Y") {
    print("Sind Sie sich wirkling sicher? (Y/N)");
    do {
      temp = stdin.readLineSync().toUpperCase();
    } while (temp != "Y" && temp != "N");
    if (temp == "Y") {
      customers.clear();
      items.clear();
      print("Alle Kunden und Artikel wurden gelöscht!");
    } else {
      return;
    }
  } else {
    return;
  }
}

void main() {
  // programm loop
  while (true) {
    String option = start();
    // exit if "Q" is selected
    switch (option) {
      case "QU":
        exit(0);
        break;
      case "NC":
        Customer.newCustomer();
        break;
      case "PC":
        Customer.printCustomers();
        break;
      case "NI":
        Item.newItem();
        break;
      case "PI":
        Item.printItem();
        break;
      case "DC":
        Customer.deleteCustomer(Customer._customers);
        break;
      case "DA":
        deleteAll(Customer._customers, Item._items);
        break;
      case "DI":
        Item.deleteItem(Item._items);
        break;
      default:
        break;
    }
  }
}
