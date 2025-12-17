class MaintenancParams {
  final int? ticketId;
  final int? maintenanceId;
  final String? note;
  final String? name;
  final String? categoryName;
  final bool isLevel1;
  final List<String>? image;
  final int? score;

  MaintenancParams({this.name, this.categoryName, this.isLevel1 = false, this.ticketId, this.maintenanceId, this.note, this.image, this.score});

  MaintenancParams.fromJson(Map<String, dynamic> json)
    : ticketId = json['TicketId'] as int?,
      maintenanceId = json['MaintenanceId'] as int?,
      note = json['Note'] as String?,
      name = json['Name'] as String?,
      categoryName = json['ChoicesId'] as String?,
      score = json['Score'] as int?,
      isLevel1 = json['IsLevel1'] as bool? ?? false,
      image = (json['Images'] as List<dynamic>?)?.map((e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'TicketId': ticketId,
    "Score": score,
    "Name": name,
    "ChoicesId": categoryName,
    'MaintenanceId': maintenanceId,
    'Note': note,
    'IsLevel1': isLevel1,
    'Images': image?.map((e) => e).toList(),
  };
}
