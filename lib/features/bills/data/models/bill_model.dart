import 'package:smart_city/features/bills/domain/entities/bill_entity.dart';

class BillModel extends BillEntity {
  BillModel({
    required super.id,
    required super.type,
    required super.amount,
    required super.issueDate,
    required super.isPaid,
    required super.citizenId,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) {
    return BillModel(
      id: json["id"],
      type: json["type"],
      amount: (json["amount"] as num).toDouble(),
      issueDate: DateTime.parse(json["issueDate"]),
      isPaid: json["isPaid"],
      citizenId: json["citizenId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type,
      "amount": amount,
      "issueDate": issueDate.toIso8601String(),
      "isPaid": isPaid,
      "citizenId": citizenId,
    };
  }

  BillModel copyWith({bool? isPaid}) {
    return BillModel(
      id: id,
      type: type,
      amount: amount,
      issueDate: issueDate,
      isPaid: isPaid ?? this.isPaid,
      citizenId: citizenId,
    );
  }
}
