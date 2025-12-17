class CreateToolsParams {
  final int? ticketId;
  final int? toolId;

  CreateToolsParams({this.ticketId, this.toolId});

  CreateToolsParams.fromJson(Map<String, dynamic> json) : ticketId = json['TicketId'] as int?, toolId = json['ToolId'] as int;

  Map<String, dynamic> toJson() => {'TicketId': ticketId, 'ToolId': toolId};
}
