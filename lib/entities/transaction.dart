import 'package:intl/intl.dart';
import 'package:pepetes/utils/StaticValues.dart';

class Transaction {
  String id;
  DateTime dateTime;
  String label;
  num amount;

  Transaction(this.id, this.dateTime, this.label, this.amount);

  @override
  String toString() {
    return 'Transaction{id: $id, dateTime: $dateTime, label: $label, amount: $amount}';
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        json['id'],
        DateFormat(DEFAULT_DATE_FORMAT).parse(json['dateTime']),
        json['label'],
        num.parse(json['amount'])
    );
  }

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'dateTime': DateFormat(DEFAULT_DATE_FORMAT).format(this.dateTime),
    'label': this.label,
    'amount': this.amount.toString()
  };
}