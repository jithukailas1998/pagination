abstract class UserEvent {
  const UserEvent();
}

class UserFetchEvent extends UserEvent {
  const UserFetchEvent();

  @override
  String toString() {
    // TODO: implement toString
    print("called userfetch event");
    return super.toString();
  }
}
