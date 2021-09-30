import 'package:pepetes/entities/transaction.dart';

class Account {
  String id;
  String username;
  List<Transaction> transactions = [];

  Account(this.id, this.username, this.transactions);

  @override
  String toString() {
    return 'Account{id: $id, username: $username}';
  }

  num getAccountBalance() {
    return this.transactions.fold(0, (previousValue, element) => previousValue + element.amount);
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        json['id'],
        json['username'],
        (json['transactions'] as List).map((e) => Transaction.fromJson(e)).toList()
    );
  }

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'username': this.username,
    'transactions': this.transactions.map((e) => e.toJson()).toList()
  };
}