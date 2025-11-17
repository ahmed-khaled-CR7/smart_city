class BillEntity {
  final int id;
  final String type;
  final double amount;
  final DateTime issueDate;
  final bool isPaid;
  final int citizenId;

  BillEntity({
    required this.id,
    required this.type,
    required this.amount,
    required this.issueDate,
    required this.isPaid,
    required this.citizenId,
  });
}