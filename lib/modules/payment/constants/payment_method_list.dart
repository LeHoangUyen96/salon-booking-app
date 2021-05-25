final Map<String, PaymentMethod> methodList = {
  'credit': PaymentMethod(
    description: 'Pay with Visacard or Master',
    image: 'assets/images/credit-card.png',
    name: 'Credit Card',
  ),
  'internet': PaymentMethod(
    description: 'Pay directly from your bank account',
    image: 'assets/images/bank-building.png',
    name: 'Internet Banking',
  ),
  'cash': PaymentMethod(
    description: 'Pay on shop',
    image: 'assets/images/money.png',
    name: 'Cash on Shop',
  ),
};

class PaymentMethod {
  final String image;
  final String name;
  final String description;

  PaymentMethod({this.image, this.name, this.description});
}
