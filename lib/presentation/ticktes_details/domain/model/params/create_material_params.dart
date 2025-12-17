class CreateMaterialParams {
  final int? ticketId;

  final List<TicketToolParams>? ticketTool;

  CreateMaterialParams({this.ticketId, this.ticketTool});

  CreateMaterialParams.fromJson(Map<String, dynamic> json)
    : ticketId = json['TicketId'] as int?,
      ticketTool = (json['TicketMaterial'] as List?)?.map((dynamic e) => TicketToolParams.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'TicketId': ticketId, 'TicketMaterial': ticketTool?.map((e) => e.toJson()).toList()};
}

class TicketToolParams {
  final int? materialId;
  final int? quantity;
  final String? status;
  final double? price;
  TicketToolParams({this.status, this.price, this.materialId, this.quantity});

  TicketToolParams.fromJson(Map<String, dynamic> json)
    : materialId = json['MaterialId'] as int?,
      status = json['Status'] as String?,
      price = json['Price'] as double?,
      quantity = json['Quantity'] as int?;

  Map<String, dynamic> toJson() => {'MaterialId': materialId, 'Status': status, 'Price': price, 'Quantity': quantity};
}
