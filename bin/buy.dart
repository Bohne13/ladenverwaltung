part of finance;

int buyItem() {
  int selectCustomer = Customer.selectCustomer();
  int selectItem = Item.selectItem();
  Customer._customers[selectCustomer]._account -= Item._items[selectItem]
      ._price;
  return 0;
}