
enum ActiveStatus {
  active,
  suspended,
  deleted,
}

extension ActiveStatusStringExtension on String {
  ActiveStatus get activeStatus {
    switch (this) {
      case "ACTIVE":
        return ActiveStatus.active;
      case "SUSPENDED":
        return ActiveStatus.suspended;
      case "DELETED":
        return ActiveStatus.deleted;
      default:
        return ActiveStatus.active;
    }
  }
}

extension ActiveStatusExtension on ActiveStatus {
  String get string {
    switch (this) {
      case ActiveStatus.active:
        return "ACTIVE";
      case ActiveStatus.suspended:
        return "SUSPENDED";
      case ActiveStatus.deleted:
        return "DELETED";
    }
  }
}
