class BuddyModel {
  String name;
  String description;
  String photoUrl;
  BuddyType buddyType;

  BuddyModel(this.name, this.description, this.photoUrl, int buddyTypeIndex) {
   this.buddyType  = buddyTypeIndex == 0? BuddyType.Buddy : BuddyType.MySelf;
 }

  factory BuddyModel.fromJson(Map<String, dynamic> map) {
    return BuddyModel(map['name'], map['description'], map['photoUrl'], map['buddyType']);
  }
}

enum BuddyType { Buddy, MySelf }
