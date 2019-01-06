class BuddyModel {
  String name;
  String description;
  String time;
  String photoUrl;
  BuddyType buddyType;

  BuddyModel(this.name, this.time, this.photoUrl, int buddyTypeIndex) {
   this.buddyType  = buddyTypeIndex == 0? BuddyType.Buddy : BuddyType.MySelf;
 }

  factory BuddyModel.fromJson(Map<String, dynamic> map) {
    return BuddyModel(map['name'], map['timestamp'], map['photoUrl'], map['buddyType']);
  }
}

enum BuddyType { Buddy, MySelf }
