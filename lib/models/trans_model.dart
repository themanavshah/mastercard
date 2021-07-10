class TransactionModel {
  final double amount;
  final String name;
  final String company;
  final String companylogo;

  TransactionModel({this.amount, this.name, this.companylogo, this.company}); 
}

List<TransactionModel> transactions = [
  TransactionModel(
    amount: -299,
    name: 'Apple ascesories',
    companylogo: '',
    company: 'apple'
  ),
  TransactionModel(
    amount: 4569,
    name: 'Amford Calcsoks',
    company: 'amford',
    companylogo: ''

  ),
  TransactionModel(
    amount: -2499,
    name: 'Apple MacBook pro',
    company: 'apple',
    companylogo: ''
  ),
  TransactionModel(
    amount: -14.99,
    name: 'Netflix Subscription',
    company: 'netflix',
    companylogo: ''
  ),
  TransactionModel(
    amount: -9.99,
    name: 'Spotify subscription',
    company: 'spotify',
    companylogo: ''
  ),
  TransactionModel(
    amount: -9.99,
    name: 'Prime Subscription',
    company: 'amazon',
    companylogo: ''
  ),
];