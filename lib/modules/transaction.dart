import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final int transactionId;
  final String type;
  final double amount;
  final String? comment;
  final String entryDate;
  final String currencyCode;
  final String balance;

  const Transaction({
    required this.transactionId,
    required this.type,
    required this.amount,
    required this.comment,
    required this.entryDate,
    required this.currencyCode,
    required this.balance,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      amount: json["amount"],
      balance: json["balance"],
      comment: json["comment"],
      currencyCode: json["currencyCode"],
      entryDate: json["entryDate"],
      transactionId: json["transactionId"],
      type: json["type"],
    );
  }
  @override
  List<Object?> get props =>
      [transactionId, type, amount, comment, entryDate, currencyCode, balance];
}
