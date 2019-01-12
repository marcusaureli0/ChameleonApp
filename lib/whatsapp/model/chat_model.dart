// Contém informações para desenhar a tela com todos os chats do usuário
class ChatModel {
  ChatModel(
      {this.userName,
      this.userId,
      this.avatarUrl,
      this.lastMessage,
      this.timestamp});

  // nome do usuário que estamos conversando
  String userName;

  // id do usuário que estamos conversando.
  String userId;

  // url do avatar do usuário 'userId'.
  String avatarUrl;

  // Texto da última mensagem enviada na conversa com o usuário 'userId'
  String lastMessage;

  // Horário que a mensagem foi recebida ou enviada
  int timestamp;

  factory ChatModel.fromJsom(Map json) {
    return ChatModel(
        userName: json['userName'],
        userId: json['userId'],
        avatarUrl: json['avatarUrl'],
        lastMessage: json['lastMessage'],
        timestamp: json['timestamp']);
  }
}
