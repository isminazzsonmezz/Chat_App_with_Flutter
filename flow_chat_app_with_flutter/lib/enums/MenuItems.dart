enum MenuItemType {
  newgroup("New Group"),
  linkedDevices("Linked Devices"),
  starredMessages("Starred Messages"),
  setting("Setting");

  final String label;
  const MenuItemType(this.label);
}

enum LoginMenuItem { help }

enum ProfileMenuItem {
  share("Share"),
  edit("Edit");

  final String label;
  const ProfileMenuItem(this.label);
}