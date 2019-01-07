class CallLogModel {
  String name;
  String description;
  String photoUrl;
  CallStream callStream;
  CallType callType;

  CallLogModel(this.name, this.description, this.photoUrl, int callStream,
      int callType) {
    this.callStream = callStream == 0 ? CallStream.Call : CallStream.Video;
    this.callType = callType == 0 ? CallType.Outgoing : CallType.Incoming;
  }
}

enum CallStream { Call, Video }
enum CallType { Outgoing, Incoming }
