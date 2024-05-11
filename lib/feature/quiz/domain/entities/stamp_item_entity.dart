class StampItem {
  final int stampIndex;
  final String createdDate;
  final bool isSigned;

  StampItem({
    required this.stampIndex,
    required this.createdDate,
    required this.isSigned,
  });

  factory StampItem.fromJson(Map<String, dynamic> json) {
    return StampItem(
      stampIndex: json['stampIndex'],
      createdDate: json['createdDate'],
      isSigned: json['isSigned'],
    );
  }
}
