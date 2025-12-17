class ChatParams {
  final int? toUserId;
  final int? ticketId;
  final String? message;
  final String? image;

  ChatParams({this.toUserId, this.ticketId, this.message, this.image});

  ChatParams.fromJson(Map<String, dynamic> json)
    : toUserId = json['ToUserId'] as int?,
      ticketId = json['TicketId'] as int?,
      message = json['message'] as String?,
      image = json['image'] as String?;

  Map<String, dynamic> toJson() => {'ToUserId': toUserId, 'TicketId': ticketId, 'message': message, 'image': image};
}
