

import 'user.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unRead;

  Message({this.sender, this.time, this.text, this.isLiked, this.unRead});
}

final User currentUser =
    User(id: 0, name: "Current user", imageUrl: "assets/images/profile.jpg");

final User steven =
    User(id: 1, name: "Steve", imageUrl: "assets/images/profile2.jpg");
final User sophia =
    User(id: 2, name: "Sophia", imageUrl: "assets/images/profile2.jpg");

final User vin =
    User(id: 1, name: "Vin", imageUrl: "assets/images/profile2.jpg");
final User mark =
    User(id: 2, name: "Mark", imageUrl: "assets/images/profile2.jpg");

final User angie =
    User(id: 1, name: "Angie", imageUrl: "assets/images/profile2.jpg");
final User david =
    User(id: 2, name: "David", imageUrl: "assets/images/profile2.jpg");

List<User> favorites = [vin, sophia, angie, steven, mark, david, vin, steven, angie];

List<Message> chats = [
  Message(
      sender: steven,
      time: "520pm",
      text: "Hey, how is the going",
      isLiked: false,
      unRead: true),
    Message(
        sender: currentUser,
        time: "630pm",
        text: "Hey, how is the going",
        isLiked: true,
        unRead: false),
    Message(
        sender: sophia,
        time: "710pm",
        text: "Hey, how is the going",
        isLiked: false,
        unRead: true),
    Message(
        sender: vin,
        time: "6300pm",
        text: "Hey, how is the going",
        isLiked: false,
        unRead: true),
  Message(
      sender: mark,
      time: "630pm",
      text: "Hey, how is the going",
      isLiked: true,
      unRead: false),
  Message(
      sender: currentUser,
      time: "710pm",
      text: "Hey, how is the going",
      isLiked: false,
      unRead: true),
  Message(
      sender: vin,
      time: "6300pm",
      text: "Hey, how is the going",
      isLiked: false,
      unRead: true),
  Message(
      sender: mark,
      time: "630pm",
      text: "Hey, how is the going",
      isLiked: true,
      unRead: false),
  Message(
      sender: currentUser,
      time: "710pm",
      text: "Hey, how is the going",
      isLiked: false,
      unRead: true),
  Message(
      sender: vin,
      time: "6300pm",
      text: "Hey, how is the going",
      isLiked: false,
      unRead: true)
];
