// Contém as informações da mensagem que será enviada
class MessageModel {
  // mensagem que será enviada ao destinatário 'toAddressId'
  String message; 
  
  // id da mensagem para confirmar o recebimento. 
  String messageId;

  // id do remetente da mensagem.
  String addressId;

  // número do telefone do remetente
  String phoneNumber;    
  
  // id do destinatário da mensagem. Pode ser um grupo ou um usuário.
  String toAddressId;

  void printMessage({String tag}) {
      print('$tag message: $message\nfrom: $phoneNumber\nmessageId: $messageId');
  }

}